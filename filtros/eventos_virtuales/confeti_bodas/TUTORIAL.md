# Tutorial: Cómo crear el filtro de confeti para bodas

## Paso 1: Configuración inicial
1. Abre Lens Studio y crea un nuevo proyecto
2. Guarda el proyecto como `confeti_bodas.lsproj`
3. Configura la escena con una cámara AR

## Paso 2: Crear el sistema de partículas
1. Haz clic derecho en la jerarquía y selecciona `Particles` > `Particle System`
2. En las propiedades del sistema de partículas, configura:
   - `Duration`: 5
   - `Looping`: Activado
   - `Prewarm`: Activado
   - `Start Delay`: 0
   - `Start Lifetime`: 3-5
   - `Start Speed`: 0.5
   - `3D Start Size`: Activado
   - `Start Size`: X:0.1, Y:0.1, Z:0.1

## Paso 3: Configurar el renderizador de partículas
1. En el sistema de partículas, ve a `Particle Renderer`
2. Establece `Render Mode` a `Mesh`
3. Crea un material nuevo y asígnalo
4. Configura el material con Shader `Particle/Additive (Soft)`

## Paso 4: Añadir formas de confeti
1. Crea texturas para las formas de confeti (corazones, estrellas, círculos)
2. Guárdalas en la carpeta `assets/textures/`
3. Asigna las texturas al material de partículas

## Paso 5: Configurar el script de control
1. Crea un nuevo Script en `Scripts/confeti_controller.js`
2. Copia el código proporcionado en el archivo
3. Asigna el script al objeto del sistema de partículas

## Paso 6: Probar el filtro
1. Usa el simulador de Lens Studio
2. Prueba los gestos de activación (sonrisa, gestos de mano)
3. Ajusta parámetros según sea necesario

## Paso 7: Exportar
1. Ve a `Publish` > `Upload Lens to Snapchat`
2. Completa la información del filtro
3. Publica y prueba en tu dispositivo

## Consejos adicionales
- Ajusta la gravedad y la física de las partículas para un efecto más realista
- Experimenta con diferentes formas y tamaños de confeti
- Añade sonidos para mayor inmersión
