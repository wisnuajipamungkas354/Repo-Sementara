            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="card h4 mt-2 mb-4 border-bottom-success font-weight-bold text-secondary bg-light border-0 rounded-0">
                            <div class="card-body text-dark">
                                <?= $title; ?>
                            </div>
                        </div>
                        <?= $this->session->flashdata('message'); ?>
                        <div class="row">
                            <div class="col-lg-7">
                                <form action="" method="post">
                                    <div class="card mb-4">
                                        <div class="card-body text-dark font-weight-bold">
                                            <div class="form-group">
                                                <label>ID Servis</label>
                                                <div class="col-sm">
                                                    <input type="text" class="form-control" id="id_servis" name="id_servis" value="<?= $ubah_servis['id_servis']; ?>" readonly>
                                                    <?= form_error('id_servis', '<small class="text-danger pl-3">', '</small>'); ?>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>ID Pelanggan</label>
                                                <div class="col-sm">
                                                    <input type="text" class="form-control" id="id_pelanggan" name="id_pelanggan" value="<?= $ubah_servis['id_pelanggan']; ?>" readonly>
                                                    <?= form_error('id_pelanggan', '<small class="text-danger pl-3">', '</small>'); ?>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Nama Pelanggan</label>
                                                <div class="col-sm">
                                                    <input type="text" class="form-control text-capitalize" id="nm_pelanggan" name="nm_pelanggan" maxlength="30" value="<?= $ubah_servis['nm_pelanggan']; ?>">
                                                    <?= form_error('nm_pelanggan', '<small class="text-danger pl-3">', '</small>'); ?>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>No. Telepon Pelanggan</label>
                                                <div class="col-sm">
                                                    <input type="text" class="form-control" id="no_hp" name="no_hp" maxlength="15" value="<?= $ubah_servis['no_hp']; ?>">
                                                    <?= form_error('no_hp', '<small class="text-danger pl-3">', '</small>'); ?>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Merk & Tipe Laptop</label>
                                                <div class="col-sm">
                                                    <input type="text" class="form-control text-capitalize" id="tipe_laptop" name="tipe_laptop" maxlength="30" value="<?= $ubah_servis['tipe_laptop']; ?>">
                                                    <?= form_error('merk', '<small class="text-danger pl-3">', '</small>'); ?>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Keluhan Awal</label>
                                                <div class="col-sm">
                                                    <textarea class="form-control" id="keluhan_awal" name="keluhan_awal"><?= $ubah_servis['keluhan_awal']; ?></textarea>
                                                    <?= form_error('keluhan', '<small class="text-danger pl-3">', '</small>'); ?>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Nama Teknisi</label>
                                                <?php
                                                $query = "SELECT * FROM karyawan WHERE jabatan='Teknisi'";
                                                $result = $this->db->query($query)->result_array();
                                                ?>
                                                <div class="col-sm">
                                                    <select class="form-control" id="nm_teknisi" name="nm_teknisi">
                                                        <option value="">Pilih Teknisi</option>
                                                        <?php foreach ($result as $teknisi) : ?>
                                                            <?php if ($teknisi['nm_karyawan'] == $ubah_servis['nm_teknisi']) : ?>
                                                                <option value="<?= $teknisi['nm_karyawan']; ?>" selected><?= $teknisi['nm_karyawan']; ?></option>
                                                            <?php else : ?>
                                                                <option value="<?= $teknisi['nm_karyawan']; ?>"><?= $teknisi['nm_karyawan']; ?></option>
                                                            <?php endif; ?>
                                                        <?php endforeach; ?>
                                                    </select>
                                                    <?= form_error('nm_teknisi', '<small class="text-danger pl-3">', '</small>'); ?>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Nama Barang</label>
                                                <div class="col-sm">
                                                    <select type="text" class="form-control" id="id_part" name="id_part">
                                                        <option value="">Pilih barang</option>
                                                        <?php foreach ($part as $p) : ?>
                                                            <?php if ($p['id_part'] == $ubah_servis['id_brg']) : ?>
                                                                <option value="<?= $p['id_part']; ?>" selected><?= $p['nm_part']; ?></option>
                                                            <?php else : ?>
                                                                <option value="<?= $p['id_part']; ?>"><?= $p['nm_part']; ?></option>
                                                            <?php endif; ?>
                                                        <?php endforeach; ?>
                                                    </select>
                                                    <?= form_error('id_part', '<small class="text-danger pl-3">', '</small>'); ?>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm">
                                                    <input type="hidden" class="form-control" id="nm_part" name="nm_part" value="<?= $ubah_servis['nm_part']; ?>" readonly>
                                                    <!-- <?= form_error('nm_part', '<small class="text-danger pl-3">', '</small>'); ?> -->
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Harga</label>
                                                <div class="col-sm">
                                                    <input type="number" class="form-control" id="harga" name="harga" value="<?= $ubah_servis['harga']; ?>" readonly>
                                                    <?= form_error('harga', '<small class="text-danger pl-3">', '</small>'); ?>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Jumlah</label>
                                                <div class="col-sm">
                                                    <input type="number" class="form-control" id="jml_part" name="jml_part" min="1" placeholder="Masukkan jumlah barang" value="<?= $ubah_servis['jml_part']; ?>">
                                                    <?= form_error('jml_part', '<small class="text-danger pl-3">', '</small>'); ?>
                                                </div>
                                            </div>

                                            <a href="<?= base_url('ManajemenData'); ?>" title="Kembali ke halaman Servis" class="btn btn-sm btn-secondary font-weight-bold mt-3">Kembali</a>
                                            <button type="submit" class="btn btn-sm btn-success font-weight-bold ml-2 mt-3">Simpan</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->