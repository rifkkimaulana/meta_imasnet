<?php

namespace App\Controllers;

use App\Models\UsersModel;
use App\Models\GoogleApiModel;

class Auth extends BaseController
{
    public function index()
    {
        if (session()->has('user_id')) {
            return redirect()->to('dashboard');
        }

        $data = [
            'title' => 'Login'
        ];
        return view('login/pages/login', $data);
    }

    public function register()
    {
        $data = [
            'title' => 'Tambah Akun',
        ];
        return view('login/pages/register', $data);
    }

    public function login()
    {
        $identitas = $this->request->getPost('user');
        $password = $this->request->getPost('password');

        $usersModel = new UsersModel();

        if (filter_var($identitas, FILTER_VALIDATE_EMAIL)) {
            $pengguna = $usersModel->where('email', $identitas)->first();
        } else {
            $pengguna = $usersModel->where('user_username', $identitas)->first();
        }

        if ($pengguna && password_verify($password, $pengguna['user_password'])) {
            session()->set('user_id', $pengguna['user_id']);
            session()->set('user_level', $pengguna['user_level']);

            // Jika kotak Remember Me dicentang, atur cookie
            if ($this->request->getPost('remember')) {
                // Enkripsi data yang akan disimpan dalam cookie
                $cookieValue = $pengguna['user_id'] . '|' . $pengguna['user_password'];

                // Set cookie dengan masa berlaku 30 hari
                $this->response->setCookie('remember_me', $cookieValue, 3600 * 24 * 30);
            }

            return redirect()->to('dashboard');
        } else {
            session()->setFlashdata('error', 'Kredensial tidak valid. Silakan coba lagi.');
            return redirect()->to('login');
        }
    }

    public function forgot_password()
    {
        if (session('user_id')) {
            return redirect()->to('admin');
        }

        $data = [
            'title' => 'Forgot Password'
        ];
        return view('login/pages/forgot-password', $data);
    }

    public function forgot_password_post()
    {
        $email = $this->request->getPost('email');

        // Cek apakah email ada dalam database
        $usersModel = new UsersModel();
        $user = $usersModel->where('email', $email)->first();

        if ($user) {

            $noWa = $user['no_wa'];

            $token = bin2hex(random_bytes(16));
            $usersModel->updateResetToken($email, $token, $noWa);

            session()->setFlashdata('success', 'Password recovery email has been sent.');
            return redirect()->to('forgot-password');
        } else {
            session()->setFlashdata('error', 'Email not found in our records.');
            return redirect()->to('forgot-password');
        }
    }

    public function recovery_view($token)
    {
        $data = [
            'token' => $token,
            'title' => 'Recovery Password'
        ];
        return view('login/pages/recovery-password', $data);
    }

    public function recovery_post()
    {
        $token = $this->request->getPost('token');

        $usersModel = new UsersModel();
        $user = $usersModel->where('reset_token', $token)->first();

        if ($user) {
            $password = $this->request->getPost('password');
            $confirm_password = $this->request->getPost('confirm-password');

            if ($password === $confirm_password) {
                // Hash password baru
                $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

                // Update password di database
                $data = [
                    'user_password' => $hashedPassword,
                    'reset_token' => null, // Hapus token reset
                ];
                $usersModel->updatePassword($user['user_id'], $data);

                session()->setFlashdata('success', 'Password berhasil dibuat ulang, silahkan login.');
                return redirect()->to(base_url('login'));
            } else {
                session()->setFlashdata('error', 'Password dan konfirmasi password tidak cocok.');
                return redirect()->to("recovery/$token");
            }
        } else {
            session()->setFlashdata('error', 'Gagal diperbaharui, coba lagi dari awal.');
            return redirect()->to(base_url('login'));
        }
    }

    public function register_post()
    {
        $userNama = $this->request->getPost('user_nama');
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
        $confirmPassword = $this->request->getPost('confirm-password');

        // Validasi input
        if ($password !== $confirmPassword) {
            session()->setFlashdata('error', 'Password confirmation does not match.');
            return redirect()->to('register');
        }

        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        $usersModel = new UsersModel();

        if ($usersModel->where('email', $email)->countAllResults() > 0) {
            session()->setFlashdata('error', 'Email is already registered.');
            return redirect()->to('register');
        }
        $userData = [
            'user_nama' => $userNama,
            'email' => $email,
            'user_password' => $hashedPassword,
            'user_level' => 'member'
        ];

        $usersModel->insertUsersMember($userData);

        session()->setFlashdata('success', 'Registration successful. Please log in.');
        return redirect()->to('login');
    }

    // Google API Login
    public function googleAuth()
    {
        $googleApiModel = new GoogleApiModel();
        $googleData = $googleApiModel->find(1);

        if ($googleData) {
            $clientId = $googleData['client_id'];
            $clientSecret = $googleData['client_secret'];

            $authUrl = $this->createAuthUrl($clientId, $clientSecret);
            return redirect()->to($authUrl);
        } else {
            return redirect()->to(base_url('login'))->with('error', 'Kami tidak dapat memverifikasi anda silahkan hubungi developer aplikasi untuk mengatur api autentikasi.');
        }
    }

    private function createAuthUrl($clientId, $clientSecret)
    {
        $redirectUri = base_url('google/callback');
        $params = array(
            'client_id' => $clientId,
            'redirect_uri' => $redirectUri,
            'response_type' => 'code',
            'scope' => 'email profile',
            'access_type' => 'online',
            'prompt' => 'select_account',
        );

        $url = 'https://accounts.google.com/o/oauth2/auth?' . http_build_query($params);
        return $url;
    }

    public function googleAuth_callback()
    {
        $googleApiModel = new GoogleApiModel();
        $googleData = $googleApiModel->find(1);

        if ($googleData) {
            $client_id = $googleData['client_id'];
            $client_secret = $googleData['client_secret'];
            $redirect_uri = base_url('google/callback');

            if ($this->request->getGet('code')) {
                $code = $this->request->getGet('code');
                $access_token = $this->getAccessToken($code, $client_id, $client_secret, $redirect_uri);

                if ($access_token) {
                    $userInfo = $this->getUserInfo($access_token);

                    $userModel = new UsersModel();
                    $user = $userModel->where('email', $userInfo['email'])->first();
                    if ($user) {
                        session()->set('user_id', $user['user_id']);
                        session()->set('user_level', $user['user_level']);
                    }
                    if (!$user) {
                        return redirect()->to(base_url('login'))->with('error', 'Email tidak terdaftar atau belum diverifikasi');
                    }
                    return redirect()->to(base_url('dashboard'))->with('success', 'Berhasil Login Menggunakan Google.');
                } else {
                    return redirect()->to(base_url('login'))->with('error', 'Gagal mendapatkan token akses dari Google.');
                }
            } else {
                return redirect()->to(base_url('login'))->with('error', 'Kode otorisasi tidak ditemukan.');
            }
        } else {
            return redirect()->to(base_url('login'))->with('error', 'Data Google API tidak ditemukan');
        }
    }

    private function getAccessToken($code, $client_id, $client_secret, $redirect_uri)
    {
        $params = array(
            'code' => $code,
            'client_id' => $client_id,
            'client_secret' => $client_secret,
            'redirect_uri' => $redirect_uri,
            'grant_type' => 'authorization_code',
        );

        $url = 'https://oauth2.googleapis.com/token';
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        $result = curl_exec($ch);
        curl_close($ch);

        $response = json_decode($result, true);

        if (isset($response['access_token'])) {
            return $response['access_token'];
        } else {
            return null;
        }
    }

    private function getUserInfo($access_token)
    {
        $url = 'https://www.googleapis.com/oauth2/v1/userinfo?access_token=' . $access_token;
        $result = file_get_contents($url);
        $response = json_decode($result, true);
        return $response;
    }

    //--------------------------------------------------------------------
}