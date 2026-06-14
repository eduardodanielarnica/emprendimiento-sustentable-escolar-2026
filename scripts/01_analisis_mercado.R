# ============================================================
#  SCRIPT 01 · Análisis de Mercado
#  Materia: Producción · ORT Argentina 2026
#  Docente: Eduardo Daniel Arnica
# ============================================================
#
#  INSTRUCCIONES:
#  1. Reemplazá los valores de ejemplo por los de tu emprendimiento
#  2. Ejecutá el script completo (Ctrl+Alt+R en RStudio)
#  3. Los gráficos se guardan automáticamente en tu carpeta de equipo
#
# ============================================================

# -- Paso 1: Definir el mercado objetivo ---------------------

nombre_emprendimiento <- "Mi Emprendimiento"   # ← Cambiá esto

# Estimación del mercado (en unidades o clientes potenciales)
mercado_total     <- 10000   # TAM: mercado total disponible
mercado_objetivo  <- 500     # SAM: segmento al que apuntamos
meta_primer_anio  <- 80      # SOM: meta realista año 1

# -- Paso 2: Segmentación por grupos de clientes -------------

segmentos <- data.frame(
  grupo      = c("Jóvenes 15–25", "Adultos 26–40", "Familias", "Empresas"),
  porcentaje = c(40, 30, 20, 10),
  interes    = c("alto", "medio", "medio", "bajo")
)

cat("\n📊 Segmentación de mercado:\n")
print(segmentos)

# Gráfico de torta del mercado
colores <- c("#4CAF50", "#2196F3", "#FF9800", "#9C27B0")
pie(segmentos$porcentaje,
    labels = paste0(segmentos$grupo, "\n", segmentos$porcentaje, "%"),
    col    = colores,
    main   = paste("Segmentación de mercado —", nombre_emprendimiento))

# -- Paso 3: Embudo de conversión ----------------------------
#
#  ¿Qué % de personas que "ven" tu producto lo compran?

cat("\n🔽 Embudo de conversión estimado:\n")

embudo <- data.frame(
  etapa      = c("Mercado total", "Conocen el producto",
                 "Interesados", "Compradores año 1"),
  personas   = c(mercado_total,
                 mercado_total * 0.30,
                 mercado_objetivo,
                 meta_primer_anio),
  tasa       = c("100%", "30%", "5%", "0.8%")
)

print(embudo)

# -- Paso 4: Análisis de competencia (simple) ----------------

competidores <- data.frame(
  nombre   = c("Competidor A", "Competidor B", "Tu emprendimiento"),
  precio   = c(450, 380, 320),
  calidad  = c(7, 6, 8),          # puntaje del 1 al 10
  sustentabilidad = c(4, 5, 9)    # puntaje del 1 al 10
)

cat("\n🏆 Mapa de competencia:\n")
print(competidores)

# Gráfico de posicionamiento
plot(competidores$precio, competidores$sustentabilidad,
     pch  = 19, cex = 2,
     col  = c("red", "orange", "darkgreen"),
     xlim = c(250, 550),
     ylim = c(1, 10),
     xlab = "Precio ($)",
     ylab = "Nivel de sustentabilidad (1–10)",
     main = "Mapa de posicionamiento competitivo")

text(competidores$precio, competidores$sustentabilidad,
     labels = competidores$nombre,
     pos = 3, cex = 0.8)

abline(h = 5, lty = 2, col = "gray")
abline(v = 400, lty = 2, col = "gray")

cat("\n✅ Análisis de mercado completado.\n")
cat("   Guardá este script con los datos reales de tu equipo\n")
cat("   y entregalo como Pull Request en el hito 1.\n\n")
