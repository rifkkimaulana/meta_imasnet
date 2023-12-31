<?php

namespace App\Controllers\Imasnet\ManajemenKeuangan;

use App\Models\Imasnet\ManajemenKeuangan\JenisKeuanganModel;
use App\Models\Imasnet\ManajemenKeuangan\KategoriKeuanganModel;

use App\Controllers\Imasnet\BaseController;

class JenisKeuangan extends BaseController
{
    public function index()
    {
        $jenisKeuanganModel = new JenisKeuanganModel();
        $kategoriKeuanganModel = new KategoriKeuanganModel();

        $kategoriMap = [];
        foreach ($kategoriKeuanganModel->findAll() as $kategori) {
            $kategoriMap[$kategori['id']] = $kategori;
        }

        $data = [
            'title' => 'Manajemen Server',
            'user' => $this->user,
            'perusahaan' => $this->aplikasi,
            'jenisKeuanganData' => $jenisKeuanganModel->findAll(),
            'kategoriMap' => $kategoriMap,
            'kategoriKeuanganData' => $kategoriKeuanganModel->findAll()
        ];
        return view('Imasnet/Pages/ManajemenKeuangan/JenisKeuangan', $data);
    }

    public function create()
    {
        $data = [
            'kategori_id' => $this->request->getPost('kategori_id'),
            'nama_jenis' => $this->request->getPost('nama_jenis'),
            'keterangan' => $this->request->getPost('keterangan'),
        ];

        $jenisKeuanganModel = new JenisKeuanganModel();

        if ($jenisKeuanganModel->insertData($data)) {
            return redirect()->to(base_url('im-manajemen-keuangan/jenis-keuangan'))->with('success', 'Data jenis keuangan berhasil disimpan');
        } else {
            return redirect()->back()->withInput()->with('error', 'Terjadi kesalahan saat menyimpan data jenis keuangan');
        }
    }

    public function update()
    {
        $id = $this->request->getPost('id');

        $data = [
            'kategori_id' => $this->request->getPost('kategori_id'),
            'nama_jenis' => $this->request->getPost('nama_jenis'),
            'keterangan' => $this->request->getPost('keterangan'),
        ];


        $jenisKeuanganModel = new JenisKeuanganModel();

        if (!$jenisKeuanganModel->updateId($id, $data)) {
            return redirect()->to(base_url('im-manajemen-keuangan/jenis-keuangan'))->with('success', 'Data jenis keuangan berhasil diubah');
        } else {
            return redirect()->back()->withInput()->with('error', 'Terjadi kesalahan saat ubah data jenis keuangan');
        }
    }

    public function delete($id)
    {
        $jenisKeuanganModel = new JenisKeuanganModel();

        if ($jenisKeuanganModel->deleteId($id)) {
            return redirect()->to(base_url('im-manajemen-keuangan/jenis-keuangan'))->with('success', 'jenis keuangan berhasil dihapus.');
        } else {
            return redirect()->to(base_url('im-manajemen-keuangan/jenis keuangan'))->with('error', 'janis keuangan gagal dihapus. Silakan coba lagi.');
        }
    }
}
