<?php

namespace App\Models;

use CodeIgniter\Model;

class KreditModel extends Model
{
    protected $table = 'tb_kredit';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'user_id',
        'no_kontrak',
        'jangka_waktu',
        'total_kredit',
        'tanggal_cetak',
        'jatuh_tempo',
        'created_at',
        'status',
        'no_transaksi'
    ];

    public function updateByNoKontrak($noKontrak, $data)
    {
        $this->set($data)
            ->where('no_kontrak', $noKontrak)
            ->update();
    }

    public function insertKredit($data)
    {
        return $this->insert($data);
    }

    public function deleteKontrak($id)
    {
        return $this->where('id', $id)->delete();
    }
}
