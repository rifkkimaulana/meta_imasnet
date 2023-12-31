<?php

namespace App\Controllers\Imasnet\ManajemenServer;

use App\Models\Imasnet\ManajemenServer\ServerModel;
use App\Models\Imasnet\ManajemenServer\PengelolaModel;

use App\Controllers\Imasnet\BaseController;

class Server extends BaseController
{
    public function index()
    {
        $modelServer = new ServerModel();
        $pengelolaData = new PengelolaModel();

        $pengelolaMap = [];
        $pengelola = $pengelolaData->findAll();

        foreach ($pengelola as $pengelola) {
            $pengelolaMap[$pengelola['id']] = $pengelola;
        }

        $data = [
            'title' => 'Manajemen Server',
            'user' => $this->user,
            'perusahaan' => $this->aplikasi,
            'serverData' => $modelServer->findAll(),
            'pengelolaData' => $pengelolaData->findAll(),
            'pengelolaMap' => $pengelolaMap,
        ];
        return view('Imasnet/Pages/ManajemenServer/Server', $data);
    }

    public function create()
    {
        $randomCode = rand(100000, 999999);
        $data = [
            'kode_server' => $randomCode,
            'nama_server' => $this->request->getPost('nama_server'),
            'alamat_server' => $this->request->getPost('alamat_server'),
            'latitude' => $this->request->getPost('latitude'),
            'longitude' => $this->request->getPost('longitude'),
            'pengelola_id' => $this->request->getPost('pengelola_id'),
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ];

        $modelServer = new ServerModel();

        if ($modelServer->insert($data)) {
            return redirect()->to(base_url('im-manajemen-server/server'))->with('success', 'Data server berhasil disimpan');
        } else {
            return redirect()->back()->withInput()->with('error', 'Terjadi kesalahan saat menyimpan data server');
        }
    }


    public function update()
    {
        $id = $this->request->getPost('id');

        $modelServer = new ServerModel();

        $data = [
            'nama_server' => $this->request->getPost('nama_server'),
            'alamat_server' => $this->request->getPost('alamat_server'),
            'latitude' => $this->request->getPost('latitude'),
            'longitude' => $this->request->getPost('longitude'),
            'pengelola_id' => $this->request->getPost('pengelola_id'),
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ];
        if (!$modelServer->updateId($id, $data)) {
            return redirect()->to(base_url('im-manajemen-server/server'))->with('success', 'Data server berhasil diubah');
        } else {
            return redirect()->back()->withInput()->with('error', 'Terjadi kesalahan saat ubah data server');
        }
    }

    public function delete($id)
    {
        $modelServer = new ServerModel();

        if ($modelServer->deleteId($id)) {
            return redirect()->to(base_url('im-manajemen-server/server'))->with('success', 'server berhasil dihapus.');
        } else {
            return redirect()->to(base_url('im-manajemen-server/server'))->with('error', 'server gagal dihapus. Silakan coba lagi.');
        }
    }
}
