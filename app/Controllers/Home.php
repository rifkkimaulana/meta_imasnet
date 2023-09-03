<?php

namespace App\Controllers;

use App\Models\UsersModel;

class Home extends BaseController
{
	// Dashboard View
	public function index()
	{
		if (!session('user_id')) {
			return redirect()->to('login');
		}

		if (
			session('user_level') !== 'administrator'
			&& session('user_level') !== 'manager'
			&& session('user_level') !== 'member'
		) {
			return redirect()->to('login');
		}

		$userModel = new UsersModel();
		$user = $userModel->find(session('user_id'));

		if (!$user) {
			return redirect()->to('login');
		}

		$data = [
			'title' => 'Dashboard',
			'user' => $user
		];
		return view('admin/pages/dashboard', $data);
	}

	// Logout All Session
	public function logout()
	{
		session()->destroy();
		$this->response->deleteCookie('remember_me');

		return redirect()->to('login');
	}
	//--------------------------------------------------------------------
}
