<?php

namespace App\Controllers\Kredit_App;

use App\Models\AplikasiModel;
use App\Models\UsersModel;
use App\Models\IdentitasModel;
use App\Models\KeranjangModel;
use App\Models\PenjualanModel;
use App\Models\ProdukModel;
use App\Models\KategoriProdukModel;

/**
 * Class BaseController
 *
 * BaseController provides a convenient place for loading components
 * and performing functions that are needed by all your controllers.
 * Extend this class in any new controllers:
 *     class Home extends BaseController
 *
 * For security be sure to declare any new methods as protected or private.
 *
 * @package CodeIgniter
 */

use CodeIgniter\Controller;

class BaseController extends Controller
{

	/**
	 * An array of helpers to be loaded automatically upon
	 * class instantiation. These helpers will be available
	 * to all other controllers that extend BaseController.
	 *
	 * @var array
	 */
	protected $helpers = [];

	/**
	 * Constructor.
	 */

	// New Protected String

	protected $user;
	protected $userFindAll;
	protected $identitas;

	protected $label;

	protected $aplikasi;

	protected $produkFindAll;
	protected $kategoriProdukFindAll;
	protected $penjualanFindAll;

	protected $userModel;
	protected $identitasModel;
	protected $aplikasiModel;
	protected $keranjangModel;
	protected $penjualanModel;
	protected $produkModel;
	protected $kategoriProdukModel;

	public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
	{
		// Do Not Edit This Line
		parent::initController($request, $response, $logger);

		//--------------------------------------------------------------------
		// Preload any models, libraries, etc, here.
		//--------------------------------------------------------------------
		// E.g.:
		// $this->session = \Config\Services::session();

		// Akses UserModel
		$this->userModel = new UsersModel();
		$this->identitasModel = new IdentitasModel();
		$this->aplikasiModel = new AplikasiModel();
		$this->keranjangModel = new KeranjangModel();
		$this->penjualanModel = new PenjualanModel();
		$this->produkModel = new ProdukModel();
		$this->kategoriProdukModel = new KategoriProdukModel();

		// Cek sesi pengguna
		if (!session('user_level') || !(session('user_level') === 'administrator' || session('user_level') === 'member')) {
			return redirect()->to(base_url('login'))->with('error', 'Anda tidak memiliki izin akses.');
		}

		$userFindAll = $this->userModel->findAll();
		$this->userFindAll = $userFindAll;

		$produkFindAll = $this->produkModel->findAll();
		$this->produkFindAll = $produkFindAll;

		$kategoriProdukFindAll = $this->kategoriProdukModel->findAll();
		$this->kategoriProdukFindAll = $kategoriProdukFindAll;

		$user = $this->userModel->where('user_id', session('user_id'))->first();
		$this->user = $user;

		$identitas = $this->identitasModel->where('user_id', session('user_id'))->first();
		$this->identitas = $identitas;

		// Mendapatkan Sesi Aktif Aplikasi
		if (!empty(session('AplicationId'))) {
			$this->aplikasi = $this->aplikasiModel->find(session('AplicationId'));
		} else {
			$this->aplikasi = $this->aplikasiModel->find($user['app_id']);
		}

		// Mendapatkan Jumlah Keranjang berdasarkan user_id
		$label = $this->keranjangModel->where('user_id', session('user_id'))->countAllResults();
		$this->label = $label;

		// Mendapatkan semua data penjualan
		$penjualan = $this->penjualanModel->findAll();
		$this->penjualanFindAll = $penjualan;
	}
}