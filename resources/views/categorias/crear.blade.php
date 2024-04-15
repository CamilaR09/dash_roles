@extends('layouts.app')

@section('content')

<section class="section">
    <div class="section-header">
        <h3 class="page__heading">Crear Categoría</h3>
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

                        <form action="{{ route('categorias.store') }}" method="POST">
                            @csrf

                            <div class="form-group">
                                <label for="descripcion">Descripción</label>
                                <input type="text" name="descripcion" class="form-control" id="descripcion" placeholder="Ingrese la descripción de la categoría">
                            </div>
                            <div class="form-group">
                                <label for="activo">Activo</label>
                                <input type="checkbox" name="activo" id="activo" checked> <!-- Checkbox para indicar si la categoría está activa -->
                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <button type="submit" class="btn btn-success">Guardar</button>
                            <a href="{{ route('categorias.index') }}" class="btn btn-danger">Cancelar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection