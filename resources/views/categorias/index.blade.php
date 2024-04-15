@extends('layouts.app')

@section('content')

<section class="section">
    <div class="section-header">
        <h3 class="page__heading">Categorías</h3>
    </div>
    <div class="section-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        @can('crear-categoria')
                        <a class="btn btn-success" href="{{ route('categorias.create') }}">Nueva Categoría</a>
                        @endcan
                        <table class="table table-striped mt-2">
                            <thead style="background-color:#6777ef">
                                <th style="display: none;">ID</th>
                                <th style="color:#fff;">Descripción</th>
                                <th style="color:#fff;">Activo</th> <!-- Nueva columna para el campo activo -->
                                <th style="color:#fff;">Acciones</th>
                            </thead>
                            <tbody>
                                @foreach ($categorias as $categoria)
                                <tr>
                                    <td style="display: none;">{{ $categoria->id }}</td>
                                    <td>{{ $categoria->descripcion }}</td>
                                    <td>{{ $categoria->activo ? 'Activa' : 'Inactiva' }}</td> <!-- Mostrar el estado activo o inactivo -->
                                    <td>
                                        <form action="{{ route('categorias.destroy',$categoria->id) }}" method="POST">
                                            <!-- Nuevo botón para mostrar información en un modal -->
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#productoModal{{ $categoria->id }}">Ver</button>
                                            @can('editar-categoria')
                                            <a class="btn btn-info" href="{{ route('categorias.edit',$categoria->id) }}">Editar</a>
                                            @endcan
                                            @csrf
                                            @method('DELETE')
                                            @can('borrar-categoria')
                                            <button type="submit" class="btn btn-danger">Borrar</button>
                                            @endcan
                                        </form>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="pagination justify-content-end">
                            {!! $categorias->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Modal para mostrar información completa del producto -->
@foreach ($categorias as $categoria)
<div class="modal fade" id="productoModal{{ $categoria->id }}" tabindex="-1" role="dialog" aria-labelledby="productoModalLabel{{ $categoria->id }}" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 style="color: red" class="modal-title" id="productoModalLabel{{ $categoria->id }}">Detalles de la Categoria</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p style="color: black"><strong>ID:</strong> {{ $categoria->id }}</p>
                <p style="color: black"><strong>Descripción:</strong> {{ $categoria->descripcion }}</p>
                <p style="color: black"><strong>activo:</strong> {{ $categoria->activo ? 'Activa' : 'Inactiva' }}</p>
                <p style="color: black"><strong>Creacion:</strong> {{ $categoria->created_at }}</p>
                <p style="color: black"><strong>Atualizacion:</strong> {{ $categoria->updated_at }}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
@endforeach

@endsection
