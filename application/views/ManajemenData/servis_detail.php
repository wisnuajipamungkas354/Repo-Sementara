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

                         <div class="row">
                             <div class="col-lg-12">
                                 <form action="" method="post">
                                     <div class="card mb-4">
                                         <div class="card-body text-dark">
                                             <table>
                                                 <tr>
                                                     <td class="font-weight-bold">ID Servis</td>
                                                     <td>: <?= $detail_servis['id_servis']; ?></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="font-weight-bold">Tanggal</td>
                                                     <td>: <?= $detail_servis['tgl']; ?></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="font-weight-bold">ID Pelanggan</td>
                                                     <td>: <?= $detail_servis['id_pelanggan']; ?></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="font-weight-bold">Nama Pelanggan</td>
                                                     <td>: <?= $detail_servis['nm_pelanggan']; ?></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="font-weight-bold"> No. Telepon</td>
                                                     <td>: <?= $detail_servis['no_hp']; ?></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="font-weight-bold"> Merk Kendaraan</td>
                                                     <td>: <?= $detail_servis['tipe_laptop']; ?></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="font-weight-bold">Keluhan</td>
                                                     <td>: <?= $detail_servis['keluhan_awal']; ?></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="font-weight-bold">Nama Teknisi</td>
                                                     <td>: <?= $detail_servis['nm_teknisi']; ?></td>
                                                 </tr>
                                                 <tr>
                                                     <td>
                                                         <a href="<?= base_url('ManajemenData'); ?>" title="Kembali ke halaman Servis" class="btn btn-sm btn-secondary font-weight-bold mt-3">Kembali</a>
                                                     </td>
                                                 </tr>
                                             </table>
                                         </div>
                                     </div>
                                 </form>

                             </div>
                         </div>

                     </div>
                     <!-- /.container-fluid -->

                 </div>
                 <!-- End of Main Content -->