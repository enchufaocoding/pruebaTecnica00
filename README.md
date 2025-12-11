# SuperStarWars App

Principios utilizados:
- Capa de red desacoplada del resto de la lógica.
- ViewModels limpios, sin lógica de red.
- Repositorio centralizado para controlar origen de los datos.
- Enfoque offline-first usando SwiftData como fuente de verdad.

---

## Estrategia de Red y Cache

### Flujo de datos
1. Los datos se cargan inmediatamente desde SwiftData.
2. Se realiza una sincronización en segundo plano con SWAPI.
3. Los datos nuevos se guardan en persistencia.
4. La interfaz se actualiza sin bloqueos.

### Paginación
Implementada manualmente usando:
- La URL `next` de SWAPI.
- Precarga cuando el usuario se acerca al final del listado.
- Prevención de llamadas repetidas mediante estado en memoria.

---

## Búsquedas y Ordenación

### Búsqueda por texto
La búsqueda se realiza localmente, sin llamadas adicionales a la API.

### Ordenación por año de nacimiento
Se incluye un parseo para interpretar correctamente:
- `BBY` (años antes de la Batalla de Yavin)
- `ABY` (años después)

---

## Escalabilidad

El proyecto está preparado para:
- Añadir más entidades de SWAPI.
- Extender la capa de persistencia.
- Implementar sincronización en segundo plano.

---

## Requisitos
- Xcode 22
- iOS 26 o superior  
- Sin librerías externas  

---

## Licencia
MIT — Libre para uso en entrevistas y portafolios.
