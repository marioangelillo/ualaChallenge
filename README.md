# Ualá Challenge – Lista de Ciudades

App iOS desarrollada como parte del challenge técnico de Ualá. La aplicación permite visualizar, buscar, filtrar y marcar como favoritas distintas ciudades, integrando una vista de mapa y soporte para orientación.

## Tecnologías utilizadas

- **Swift 5**
- **SwiftUI**
- **Clean Architecture** (Presentation, Domain, Data)
- **Async/Await**
- **Unit Testing con XCTest**
- **UI Testing con XCTest / XCUIApplication**

## Funcionalidades

- Listado de ciudades (desde endpoint o mock)
- Búsqueda por nombre en tiempo real
- Marcar ciudades como favoritas (persistencia local con UserDefaults)
- Filtrado por favoritas
- Detalle de ciudad en un mapa
- Modo landscape con vista dividida

## Tests

- **Unit Tests**
  - Cubren lógica de búsqueda, favoritos, filtros y casos de uso.
- **UI Tests**
  - Validan elementos visibles y comportamiento de la interfaz (TextField, Toggle, Lista).
 
## Enfoque de arquitectura y manejo de datos

Para optimizar el rendimiento y mantener una arquitectura clara, el proyecto realiza una única llamada al servicio remoto que provee el listado completo de ciudades. Esta información es almacenada en memoria dentro del ViewModel, evitando múltiples llamadas innecesarias a la red.
A partir de esa fuente única de datos (cities), se construye un segundo array (filteredCities), que representa las ciudades visibles en pantalla. Esta lista filtrada se actualiza dinámicamente según los criterios activos, como el texto ingresado por el usuario en el campo de búsqueda y el estado del filtro de favoritos. Esto permite aplicar filtros en tiempo real sin afectar la fuente original.

Además, se desacopló el modelo de datos proveniente del servicio remoto (DTO) mediante un mapeo explícito hacia un modelo de dominio adaptado a la vista. Este modelo fue diseñado específicamente para las necesidades de presentación, e incluye propiedades calculadas y métodos auxiliares que permiten mostrar la información de forma clara y contextualizada en la interfaz de usuario.

Este enfoque contribuye a una mayor cohesión en la capa de presentación, facilita los tests y respeta los principios de Clean Architecture separando responsabilidades entre las capas de datos, dominio y presentación.
  

