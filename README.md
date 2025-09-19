# 📋 ToDoList en Solidity

Este es un proyecto de contrato inteligente desarrollado en **Solidity** que simula una lista de tareas simple (To-Do List) dentro de la **Ethereum Virtual Machine (EVM)**.

El objetivo principal es con fines educativos, demostrando el uso de:
* **Structs** (estructuras de datos) para definir una tarea.
* **Enums** (enumeradores) para gestionar el estado de una tarea (`PENDIENTE`, `EN_PROCESO`, `COMPLETADO`).
* **Arrays dinámicos** (`Tarea[] public s_tareas`) para almacenar la lista de tareas en el almacenamiento del contrato.
* **Eventos** para notificar a las aplicaciones externas sobre cambios en el estado del contrato (agregar, actualizar, eliminar tareas).
* Una técnica de **eliminación eficiente** (`swap-and-pop`) para optimizar el gas.

## Estructura del Contrato

El contrato `ToDoList` incluye las siguientes funcionalidades:

| Función | Tipo | Descripción |
| :--- | :--- | :--- |
| `addTarea(string, string)` | `external` | Agrega una nueva tarea con título y descripción, estableciendo el estado inicial en `PENDIENTE`. |
| `getTarea(uint256)` | `external view` | Devuelve los datos de una tarea por su índice. |
| `updateTituloTarea(uint256, string)` | `external` | Actualiza el título de una tarea existente. |
| `updateDescripcionTarea(uint256, string)` | `external` | Actualiza la descripción de una tarea existente. |
| `updateEstadoEnProcesoTarea(uint256)` | `external` | Cambia el estado de una tarea a `EN_PROCESO`. |
| `updateEstadoCompletoTarea(uint256)` | `external` | Cambia el estado de una tarea a `COMPLETADO`. |
| `deleteTarea(uint256)` | `external` | Elimina una tarea por su índice utilizando el patrón de "swap-and-pop". |

## 🚀 Cómo Clonar y Ejecutar en un IDE

Para interactuar con este contrato de Solidity, se recomienda utilizar **Remix IDE**, un entorno de desarrollo integrado basado en navegador ideal para escribir, desplegar y probar contratos.

### 1. Clonar el Repositorio

Puedes clonar este repositorio en tu máquina local o simplemente copiar el código del archivo `ToDoList.sol`.

```
git clone https://github.com/ffacun2/ToDoList_Solidity.git
```

2. Abrir y Configurar en Remix IDE
  1. Abre Remix IDE.

  2. Crea un nuevo archivo en la carpeta contracts (por ejemplo, ToDoList.sol).

  3. Copia y pega el código de ToDoList.sol en el nuevo archivo.

3. Compilar el Contrato
  1. Navega al segundo icono en la barra lateral izquierda (el de un compilador de Solidity).

  2. Asegúrate de que la versión del compilador sea compatible (la directiva pragma especifica 0.8.30 o superior).

  3. Haz clic en el botón "Compile ToDoList.sol". Deberías ver una marca de verificación verde, indicando que la compilación fue exitosa.

4. Desplegar y Probar el Contrato
  1. Navega al tercer icono en la barra lateral izquierda (el de un logo de Ethereum, Deploy & Run Transactions).

  2. En el entorno Environment, selecciona "Injected Provider - MetaMask" si deseas desplegar en una red de prueba real (como Sepolia), o "Remix VM (Shanghai)" para una prueba local instantánea.

  3. Asegúrate de que el contrato seleccionado (CONTRACT) sea ToDoList.

  4. Haz clic en el botón "Deploy".

  5. Una vez desplegado, el contrato aparecerá en la sección "Deployed Contracts" en la parte inferior de la pestaña.

  6. Expande el contrato para ver y probar todas sus funciones. Por ejemplo:

  * Usa addTarea con un título y una descripción para agregar una tarea.

  * Usa el botón s_tareas (público array) para ver cuántas tareas hay.

  * Usa getTarea con un índice (empezando por 0) para obtener los detalles de una tarea.
