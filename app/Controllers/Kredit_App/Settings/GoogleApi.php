<?php

namespace App\Controllers\Kredit_App\Settings;

use App\Models\GoogleApiModel;

use App\Controllers\Kredit_App\BaseController;

class GoogleApi extends BaseController
{
    public function index()
    {
        // Cek apakah pengguna memiliki akses yang sesuai
        if ($this->user['user_level'] !== 'administrator') {
            return redirect()->to(base_url('access_denied'))->with('error', 'Anda tidak memiliki akses ke halaman ini.');
        }

        $googleApiModel = new GoogleApiModel();

        $data = [
            'title' => 'Google API Settings',
            'user' => $this->user,
            'perusahaan' => $this->aplikasi,
            'label' => $this->label,
            'google' => $googleApiModel->find($this->aplikasi['googleapi_id'])
        ];
        return view('kredit_app/pages/Settings/ApiGoogle', $data);
    }

    public function GoogleApiUpdate()
    {
        // Cek apakah pengguna memiliki akses yang sesuai
        if ($this->user['user_level'] !== 'administrator') {
            return redirect()->to(base_url('access_denied'))->with('error', 'Anda tidak memiliki akses ke halaman ini.');
        }

        $googleApiModel = new GoogleApiModel();
        $data = [
            'client_id' => $this->request->getPost('client_id'),
            'client_secret' => $this->request->getPost('client_secret'),
        ];

        $googleApiModel->updateGoogle($data);

        return redirect()->to(base_url('ka-settings/google_api'))->with('success', 'Api Google anda berhasil diperbarui.');
    }
}
