<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

//agregago el modelo de permisos de spatie
use Spatie\Permission\Models\Permission;

class SeederTablaPermisos extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permisos = [
            // Operaciones sobre tabla roles
            'ver-rol',
            'crear-rol',
            'editar-rol',
            'borrar-rol',
            // Operaciones sobre tabla categorias
            'ver-categoria',
            'crear-categoria',
            'editar-categoria',
            'borrar-categoria',
            // Operaciones sobre tabla productos
            'ver-producto',
            'crear-producto',
            'editar-producto',
            'borrar-producto',
            // Operaciones sobre tabla Usuarios
            'ver-usuario',
            'crear-usuario',
            'editar-usuario',
            'borrar-usuario',

        ];
        foreach($permisos as $permiso) {
            Permission::create(['name'=>$permiso]);}

        
    }
}
