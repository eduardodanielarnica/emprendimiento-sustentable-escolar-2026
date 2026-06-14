# Guía del Líder de Equipo

Esta guía resume tus responsabilidades semanales como Líder de Equipo.

---

## Checklist semanal

### Cada lunes
- [ ] Revisar el tablero de Proyectos: ¿hay tareas vencidas sin mover?
- [ ] Verificar que todos los integrantes tengan tareas asignadas
- [ ] Actualizar el estado de cada tarea (En progreso / Bloqueado / Hecho)

### Antes de cada hito
- [ ] Revisar que el script R corre sin errores en una máquina limpia
- [ ] Abrir el Issue o Pull Request con al menos 2 días de anticipación
- [ ] Completar el template de entrega con conclusiones del equipo
- [ ] Avisar al docente si hay algún impedimento antes de la fecha

### Cómo abrir un Issue correctamente

1. Ir a la pestaña **Issues** del repositorio
2. Hacer clic en **New issue**
3. Elegir el template correspondiente
4. Completar todos los campos del template
5. Asignar la etiqueta correcta (`pregunta`, `hito-1`, `hito-2`, `hito-3`)
6. Asignárselo al docente (`@eduardodanielarnica`)

### Cómo crear un Pull Request para la entrega

```bash
# En tu computadora, dentro de la carpeta del proyecto:

# 1. Crear una rama para tu equipo
git checkout -b equipo-A/hito-1

# 2. Agregar tus archivos
git add scripts/01_analisis_mercado.R

# 3. Confirmar los cambios con un mensaje claro
git commit -m "Equipo A: análisis de mercado - hito 1"

# 4. Subir la rama a GitHub
git push origin equipo-A/hito-1

# 5. Ir a GitHub y crear el Pull Request desde tu rama hacia main
```

---

## Reglas de convivencia del repositorio

- **No hacer push directo a `main`** — siempre trabajar en una rama propia
- **Un commit = un cambio claro** — describirlo en el mensaje
- **No sobreescribir el trabajo de otro equipo** — cada equipo tiene su carpeta
- **Las dudas van en Issues, no en WhatsApp del docente** — así todos aprenden

---

*¿Dudas sobre este proceso? Abrí un Issue con la etiqueta `pregunta`.*
