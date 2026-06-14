# 🌱 Emprendimiento Sustentable Escolar 2026
### Materia: Producción · Escuela ORT Argentina
> **Docente:** Eduardo Daniel Arnica · Ciclo lectivo 2026

---

## ¿Qué es este repositorio?

Este es el **centro operativo de la materia**. Aquí gestionamos el avance de todos los proyectos de manera profesional y colaborativa, combinando herramientas de la industria tecnológica con análisis cuantitativo en R.

Cada grupo diseñará, evaluará y defenderá un **emprendimiento sustentable real** usando datos, modelos financieros y pensamiento crítico.

---

## 🗂️ Estructura del repositorio

```
emprendimiento-sustentable-escolar-2026/
│
├── 📁 scripts/              ← Modelos base en R (análisis, finanzas, decisiones)
│   ├── 01_analisis_mercado.R
│   ├── 02_modelo_financiero.R
│   └── 03_sensibilidad.R
│
├── 📁 equipos/              ← Subcarpetas por grupo (se generan al inicio del ciclo)
│   ├── equipo-A/
│   ├── equipo-B/
│   └── equipo-C/
│
├── 📁 hitos/                ← Rúbricas, fechas clave y criterios de evaluación
│   └── calendario_2026.md
│
└── 📁 recursos/             ← Guías, datasets de ejemplo, plantillas
    └── dataset_ejemplo.csv
```

---

## ⚙️ ¿Cómo vamos a trabajar?

### 1 · Gestión Ágil con GitHub Projects

Todo el flujo de trabajo vive en el **[tablero de Proyectos →](../../projects)**

Allí vas a encontrar:
- Las tareas asignadas a tu equipo
- El estado de cada etapa (Pendiente / En progreso / Entregado / Aprobado)
- Los plazos de entrega por hito

### 2 · Análisis con R

En la carpeta `scripts/` encontrás los modelos base que usaremos para:
- Análisis de mercado y segmentación
- Proyecciones financieras (flujo de caja, punto de equilibrio)
- Análisis de sensibilidad para toma de decisiones

> 💡 No se necesita experiencia previa en R. Los scripts están comentados paso a paso.

### 3 · Colaboración mediante Pull Requests

Las entregas de código y modelos se realizan mediante **Pull Requests**. Este es el canal oficial de retroalimentación técnica: documentado, trazable y profesional.

---

## 👥 Dinámica de Equipos

Cada grupo designa un **Líder de Equipo** con estas responsabilidades:

| Responsabilidad | Herramienta |
|---|---|
| Mantener el tablero actualizado | GitHub Projects |
| Centralizar dudas técnicas | Issues |
| Coordinar la entrega final | Pull Request |

### Equipos 2026

| Equipo | Integrantes | Proyecto | Estado |
|---|---|---|---|
| 🟢 Equipo A | _por completar_ | _por definir_ | ![](https://img.shields.io/badge/estado-inicio-lightgrey) |
| 🔵 Equipo B | _por completar_ | _por definir_ | ![](https://img.shields.io/badge/estado-inicio-lightgrey) |
| 🟣 Equipo C | _por completar_ | _por definir_ | ![](https://img.shields.io/badge/estado-inicio-lightgrey) |

> El docente actualizará esta tabla en la primera semana de clases.

---

## 🏁 Hitos del ciclo

```
Semana 1–2   │  Formación de equipos + elección del emprendimiento
Semana 3–4   │  🔖 HITO 1: Análisis de mercado (script R + Issue de presentación)
Semana 5–7   │  Modelado financiero + análisis de sensibilidad
Semana 8     │  🔖 HITO 2: Modelo financiero completo (Pull Request)
Semana 9–11  │  Iteración, ajuste por retroalimentación
Semana 12    │  🔖 HITO 3: Defensa final del emprendimiento
```

---

## 🧪 Primeros pasos en R — Tutorial mínimo

No te asustes. Este es todo el R que necesitás para arrancar:

```r
# Cargar datos de tu emprendimiento
datos <- read.csv("recursos/dataset_ejemplo.csv")

# Ver un resumen rápido
summary(datos)

# Calcular punto de equilibrio
costo_fijo    <- 5000   # en pesos
precio_venta  <- 350
costo_variable <- 120

punto_equilibrio <- costo_fijo / (precio_venta - costo_variable)
cat("Unidades para equilibrio:", round(punto_equilibrio), "\n")

# Graficar ingresos vs costos
unidades <- 0:100
ingresos <- unidades * precio_venta
costos   <- costo_fijo + unidades * costo_variable

plot(unidades, ingresos, type = "l", col = "darkgreen",
     xlab = "Unidades vendidas", ylab = "Pesos ($)",
     main = "Punto de Equilibrio")
lines(unidades, costos, col = "red")
legend("topleft", legend = c("Ingresos", "Costos"),
       col = c("darkgreen", "red"), lty = 1)
```

---

## 🎯 Objetivo del curso

> Desarrollar **competencias digitales avanzadas** y pensamiento crítico, permitiendo que cada grupo pase de la teoría a la **toma de decisiones basada en evidencia técnica**.

Al finalizar la materia, cada equipo habrá:
- ✅ Diseñado un emprendimiento sustentable viable
- ✅ Construido y validado un modelo financiero en R
- ✅ Trabajado con flujos de trabajo colaborativos reales (Git, Issues, PR)
- ✅ Defendido sus decisiones con datos frente al curso

---

## 📬 ¿Dudas?

1. Primero buscá si ya hay un **Issue abierto** con tu pregunta
2. Si no existe, **abrí un nuevo Issue** con la etiqueta `pregunta`
3. El Líder de Equipo es el responsable de comunicar las dudas técnicas

---

*Repositorio gestionado por el docente · Escuela ORT Argentina · 2026*
