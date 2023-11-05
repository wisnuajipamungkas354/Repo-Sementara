    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
            <div class="sidebar-brand-icon rotate-n-15">
                <img src="<?= base_url('assets/img/login/'); ?>ahayy-rounded.png" alt="logo" width="50">
            </div>
            <div class="sidebar-brand-text mx-3">Wisnu-Tech</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Query Menu  -->
        <?php
        $id_role = $this->session->userdata('id_role');
        $queryMenu = "SELECT * 
                            FROM `user_menu` 
                            JOIN `user_access`
                            ON `user_menu`.`id_menu` = `user_access`.`id_menu`
                            WHERE `user_access`.`id_role` = $id_role
                            ORDER BY `user_access`.`id_menu` ASC";

        $menu = $this->db->query($queryMenu)->result_array();
        ?>


        <!-- Looping Menu -->

        <?php foreach ($menu as $m) : ?>
            <?php if ($title == $m['title']) : ?>
                <li class="nav-item active">
                <?php else : ?>
                <li class="nav-item">
                <?php endif; ?>
                <a class="nav-link pb-0" href="<?= base_url($m['url']); ?>">
                    <i class="<?= $m['icon']; ?>"></i>
                    <span><?= $m['title']; ?></span>
                </a>
                </li>
            <?php endforeach; ?>

            <!-- Divider -->
            <hr class="sidebar-divider mt-3">



            <!-- Heading -->
            <div class="sidebar-heading">
                Keluar
            </div>

            <!-- Nav Item - Profile Menu -->
            <li class="nav-item">
                <a href="<?= base_url('auth/logout'); ?>" class="nav-link logout">
                    <i class="fas fa-fw fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

    </ul>
    <!-- End of Sidebar -->