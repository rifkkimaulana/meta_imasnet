<?= $this->extend('admin/layout/template'); ?>
<?= $this->section('content'); ?>

<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <!-- Main row -->
        <form role="form" method="post" action="<?= base_url('produk/kategori'); ?>" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title"><?= $title; ?></h3>
                            <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#addModal">
                                Tambah Kategori Produk
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tablerifkkimaulana" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center" style="padding: 10px;"></th>
                                            <th class="text-center" style="padding: 10px;">Nama Kategori</th>
                                            <th class="text-center" style="padding: 10px;">Deskripsi</th>
                                            <th class="text-center" style="padding: 10px;">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($kategoriProduk as $kategori) :
                                            $no = 1; ?>

                                            <tr>
                                                <td class="text-center"><?= $no++ ?></td>
                                                <td><?= $kategori['nama_kategori'] ?></td>
                                                <td><?= $kategori['deskripsi'] ?></td>
                                                <td class="text-center">
                                                    <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editModal<?= $kategori['id'] ?>">
                                                        <i class="far fa-edit"></i> Edit
                                                    </a>
                                                    <a class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal<?= $kategori['id'] ?>">
                                                        <i class="far fa-trash-alt"></i> Delete
                                                    </a>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- /.content -->

<!-- Modal Tambah Produk -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addModalLabel">Tambah Kategori Produk</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="<?= base_url('produk/kategori') ?>" enctype="multipart/form-data">
                <div class="modal-body">
                    <!-- Form input untuk menambahkan data produk -->
                    <div class="form-group">
                        <label for="nama_produk">Nama Kategori</label>
                        <input type="text" class="form-control" id="nama_produk" name="nama_kategori">
                    </div>
                    <div class="form-group">
                        <label for="deskripsi">Deskripsi</label>
                        <textarea class="form-control" id="deskripsi" name="deskripsi"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Tambah Kategori</button>
                </div>
            </form>
        </div>
    </div>
</div>


<?php foreach ($kategoriProduk as $kategori) : ?>

    <!-- Modal Konfirmasi Delete -->
    <div class="modal fade" id="deleteModal<?= $kategori['id'] ?>" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Konfirmasi Hapus</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Apakah Anda yakin ingin menghapus Kategori: <?= $kategori['nama_kategori'] ?>?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <a href="<?= base_url('produk/kategori/delete/' . $kategori['id']) ?>" class="btn btn-danger">Hapus</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal edit Produk -->
    <div class="modal fade" id="editModal<?= $kategori['id'] ?>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit Produk</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" action="<?= base_url('kategori/edit') ?>" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="nama_produk">Nama Kategori</label>
                            <input type="text" class="form-control" id="nama_produk" name="nama_produk" value="<?= $kategori['nama_kategori'] ?>">
                        </div>
                        <div class="form-group">
                            <label for="deskripsi">Deskripsi</label>
                            <textarea class="form-control" id="deskripsi" name="deskripsi"><?= $kategori['deskripsi'] ?></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<?php endforeach; ?>

<?= $this->endSection(); ?>