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
                                <th style="color:#fff;">Acciones</th>
                            </thead>
                            <tbody>
                                @foreach ($categorias as $categoria)
                                <tr>
                                    <td style="display: none;">{{ $categoria->id }}</td>
                                    <td>{{ $categoria->descripcion }}</td>
                                    <td>
                                        <form action="{{ route('categorias.destroy',$categoria->id) }}" method="POST">
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

@endsection