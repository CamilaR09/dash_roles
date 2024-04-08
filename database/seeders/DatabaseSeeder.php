<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Categoria;
use App\Models\Producto;
use App\Models\User;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        
        // Seed Permissions
        $this->call(SeederTablaPermisos::class);

        // Seed Categorias
        Categoria::factory(100)->create();

        // Seed Productos
        Producto::factory(500)->create();
    }
}
