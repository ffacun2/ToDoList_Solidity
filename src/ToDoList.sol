// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/*
 * @title Contrato para gestionar lista de tareas
 * @author Facundo Criado
 * @notice Contrato con fines educativos
*/

contract ToDoList {

    //@notice enum que representa los estados de una tarea
    enum s_estado {
        PENDIENTE,
        EN_PROCESO,
        COMPLETADO
    }

    //@notice struct para almacenar los datos relacionados a una tarea
    struct Tarea {
        string titulo;
        string descripcion;
        uint256 fecha_creacion;
        s_estado estado;
    }

    //@notice lista de tareas de tipo Tarea
    Tarea[] public s_tareas;

    //@notice evento emitido cuando una tarea es agregada a la lista de tareas
    event ToDoList_AddTarea(Tarea tarea);

    /*
     * @notice funcion que agrega una tarea a la lista de tarea y emite el evento
     * @param _descripcion descripcion de la tarea a ser creada
    */
    function addTarea (string memory _titulo,string memory _descripcion) external {
        Tarea memory tarea = Tarea ({
            titulo: _titulo,
            descripcion: _descripcion,
            fecha_creacion: block.timestamp,
            estado: s_estado.PENDIENTE
        });

        s_tareas.push(tarea);

        emit ToDoList_AddTarea(tarea);
    }

    /*
     * @notice funcion que obtiene una tarea con un index determinado
     * @param _index index de la tarea a obtener
      * @return tarea de tipo Tarea
    */
    function getTarea(uint256 _index) external view returns (Tarea memory) {
        return s_tareas[_index];
    }

    //@notice evento que se lanza al actualizar el titulo de una tarea
    event ToDoList_UpdateTituloTarea(Tarea tarea);

    /*
     * @notice funcion que actualiza el titulo de la tarea de un index determinado
     * @param _index index de la tarea a actualizar
     * @param _titulo tituno nuevo a actualizar
    */
    function updateTituloTarea (uint256 _index, string memory _titulo) external {
        s_tareas[_index].titulo = _titulo;

        emit ToDoList_UpdateTituloTarea(s_tareas[_index]);
    }

    //@notice evento que se lanza al actualizar la descripcion de una tarea
    event ToDoList_UpdateDescripcionTarea(Tarea tarea);

    /*
     * @notice funcion que actualiza la descripcion de la tarea de un index determinado
     * @param _index index de la tarea a actualizar
     * @param _descripcion tituno nuevo a actualizar
    */
    function updateDescripcionTarea (uint256 _index, string memory _descripcion) external {
        s_tareas[_index].descripcion = _descripcion;

        emit ToDoList_UpdateDescripcionTarea(s_tareas[_index]);
    }

    //@notice evento que se lanza al actualizar el estado de una tarea
    event ToDoList_UpdateEstadoTarea(Tarea tarea);

    /*
     * @notice funcion que actualiza la el estado de la tarea de un index determinado
     * @param _index index de la tarea a actualizar
    */
    function updateEstadoEnProcesoTarea (uint256 _index) external {
        s_tareas[_index].estado = s_estado.EN_PROCESO;

        emit ToDoList_UpdateEstadoTarea(s_tareas[_index]);
    }

    /*
     * @notice funcion que actualiza la el estado de la tarea de un index determinado
     * @param _index index de la tarea a actualizar
    */
    function updateEstadoCompletoTarea (uint256 _index) external {
        s_tareas[_index].estado = s_estado.COMPLETADO;

        emit ToDoList_UpdateEstadoTarea(s_tareas[_index]);
    }

    //@notice evento que se lanza cuando una tarea es eliminada
    event ToDoList_DeleteTarea(string msj);

    /*
     * @notice funcion que busca la tarea y la elimina
     * @param _index de la tarea a eliminar
    */
    function deleteTarea (uint256 _index) external {
        uint256 size = s_tareas.length;

        s_tareas[_index].titulo = s_tareas[size-1].titulo;
        s_tareas[_index].descripcion = s_tareas[size-1].descripcion;
        s_tareas[_index].fecha_creacion = s_tareas[size-1].fecha_creacion;
        s_tareas[_index].estado = s_tareas[size-1].estado;

        s_tareas.pop();
        emit ToDoList_DeleteTarea("ok");
        return;
    }

}