<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Categoria extends Model
{
    use HasFactory;
    protected $fillable = [
        'descripcion','activo'
    ];

    /**
     * Obtenga los productos asociados a la categoría.
     */
    public function productos(): HasMany
    {
        return $this->hasMany(Producto::class, 'categoria_id');
    }
    public static function boot()
{
    parent::boot();

    static::creating(function($categoria) {
        // Por defecto, estableceremos la categoría como activa al momento de crearla
        $categoria->activo = true;
    });
}
}
