@extends('layouts.app')

@section('content')

<section class="section">
    <div class="section-header">
        <h3 class="page__heading">Crear Producto</h3>
    </div>
    <div class="section-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        @if ($errors->any())                                                
                            <div class="alert alert-dark alert-dismissible fade show" role="alert">
                            <strong>¡Revise los campos!</strong>                        
                                @foreach ($errors->all() as $error)                                    
                                    <span class="badge badge-danger">{{ $error }}</span>
                                @endforeach                        
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            </div>
                        @endif

                        <form action="{{ route('productos.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <div class="form-group">
                                <label for="categoria_id">Categoría</label>
                                <select name="categoria_id" class="form-control" id="categoria_id">
                                    <option value="">Seleccione una categoría</option>
                                    @foreach ($categorias as $categoria)
                                        @if ($categoria->activo) <!-- Verificar si la categoría está activa -->
                                            <option value="{{ $categoria->id }}">{{ $categoria->descripcion }}</option>
                                        @endif
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Ingrese el nombre del producto">
                            </div>

                            <div class="form-group">
                                <label for="descripcion">Descripción</label>
                                <textarea name="descripcion" class="form-control" id="descripcion" rows="3" placeholder="Ingrese la descripción del producto"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="precio">Precio</label>
                                <input type="number" step="0.01" name="precio" class="form-control" id="precio" placeholder="Ingrese el precio del producto">
                            </div>

                            <div class="form-group">
                                <label for="stock">Stock</label>
                                <input type="number" name="stock" class="form-control" id="stock" placeholder="Ingrese el stock del producto">
                            </div>
                            

                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <button type="submit" class="btn btn-success">Guardar</button>
                            <a href="{{ route('productos.index') }}" class="btn btn-danger">Cancelar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection