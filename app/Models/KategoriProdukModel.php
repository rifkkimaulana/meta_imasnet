<?php

namespace App\Models;

use CodeIgniter\Model;

class KategoriProdukModel extends Model
{
    protected $table = 'tb_kategoriproduk';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'nama_kategori', 'deskripsi'
    ];

    // Relationship dengan produk
    public function produk()
    {
        return $this->hasMany(ProdukModel::class, 'kategori_id');
    }

    public function insertKategori($data)
    {
        return $this->insert($data);
    }

    public function updateKategori($id, $data)
    {
        $this->update($id, $data);
    }

    public function deleteKategoriProduk($id)
    {
        $this->where('id', $id)->delete();
    }
}
