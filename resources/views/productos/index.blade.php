@extends('layouts.app')

@section('content')

<section class="section">
    <div class="section-header">
        <h3 class="page__heading">Productos</h3>
    </div>
    <div class="section-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        @can('crear-producto')
                        <a class="btn btn-success" href="{{ route('productos.create') }}">Nuevo Producto</a>
                        @endcan
                        <table class="table table-striped mt-2">
                            <thead style="background-color:#6777ef">
                                <th style="display: none;">ID</th>
                                <th style="color:#fff;">Nombre</th>
                                <th style="color:#fff;">Descripción</th>
                                <th style="color:#fff;">Precio</th>
                                <th style="color:#fff;">Stock</th>
                                <th style="color:#fff;">Categoría</th>
                                <th style="color:#fff;">Acciones</th>
                            </thead>
                            <tbody>
                                @foreach ($productos as $producto)
                                <tr>
                                    <td style="display: none;">{{ $producto->id }}</td>
                                    <td>{{ $producto->nombre }}</td>
                                    <td>{{ $producto->descripcion }}</td>
                                    <td>{{ $producto->precio }}</td>
                                    <td>{{ $producto->stock }}</td>
                                    <td>{{ $producto->categoria->descripcion }}</td>
                                    <td>
                                        <form action="{{ route('productos.destroy',$producto->id) }}" method="POST">
                                            <!-- Nuevo botón para mostrar información en un modal -->
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#productoModal{{ $producto->id }}">Ver</button>
                                        
                                            @can('editar-producto')
                                            <a class="btn btn-info" href="{{ route('productos.edit',$producto->id) }}">Editar</a>
                                            @endcan
                                            @csrf
                                            @method('DELETE')
                                            @can('borrar-producto')
                                            <button type="submit" class="btn btn-danger">Borrar</button>
                                            @endcan
                                        </form>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="pagination justify-content-end">
                            {!! $productos->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Modal para mostrar información completa del producto -->
@foreach ($productos as $producto)
<div class="modal fade" id="productoModal{{ $producto->id }}" tabindex="-1" role="dialog" aria-labelledby="productoModalLabel{{ $producto->id }}" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 style="color: red" class="modal-title" id="productoModalLabel{{ $producto->id }}">Detalles del Producto</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p style="color: black"><strong>ID:</strong> {{ $producto->id }}</p>
                <p style="color: black"><strong>Nombre:</strong> {{ $producto->nombre }}</p>
                <p style="color: black"><strong>Descripción:</strong> {{ $producto->descripcion }}</p>
                <p style="color: black"><strong>Precio:</strong> {{ $producto->precio }}</p>
                <p style="color: black"><strong>Stock:</strong> {{ $producto->stock }}</p>
                <p style="color: black"><strong>Categoría:</strong> {{ $producto->categoria->descripcion }}</p>
                <p style="color: black"><strong>Creacion:</strong> {{ $producto->created_at }}</p>
                <p style="color: black"><strong>Atualizacion:</strong> {{ $producto->updated_at }}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
@endforeach

@endsection
