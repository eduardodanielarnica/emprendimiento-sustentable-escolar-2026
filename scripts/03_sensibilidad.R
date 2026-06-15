# ============================================================
#  SCRIPT 03 · Análisis de Sensibilidad
#  Materia: Producción · ORT Argentina 2026
#  Docente: Eduardo Daniel Arnica
# ============================================================
#
#  ¿Qué pasa si las ventas bajan un 20%? ¿O si sube el costo?
#  Este script muestra cómo distintas variables afectan
#  la rentabilidad de tu emprendimiento.
#
# ============================================================

# -- Parámetros base (traer del script 02) -------------------

precio_base       <- 350
costo_var_base    <- 120
costo_fijo_base   <- 5000
ventas_base       <- 55    # ventas mensuales promedio esperadas

ganancia_base <- ventas_base * (precio_base - costo_var_base) - costo_fijo_base

cat("════════════════════════════════════════\n")
cat(" ANÁLISIS DE SENSIBILIDAD\n")
cat("════════════════════════════════════════\n\n")
cat("📌 Escenario base:\n")
cat("   Ventas:", ventas_base, "u. | Precio: $", precio_base,
    "| Ganancia: $", ganancia_base, "\n\n")

# -- Escenario 1: Variación en el precio ---------------------

variaciones <- seq(-30, 30, by = 10)   # variación porcentual

cat("📈 SENSIBILIDAD AL PRECIO\n")
cat("──────────────────────────────────\n")

resultados_precio <- data.frame(
  Variacion_pct = variaciones,
  Precio_nuevo  = round(precio_base * (1 + variaciones/100)),
  Ganancia      = sapply(variaciones, function(v) {
    p_nuevo <- precio_base * (1 + v/100)
    round(ventas_base * (p_nuevo - costo_var_base) - costo_fijo_base)
  })
)
resultados_precio$Impacto <- round(
  (resultados_precio$Ganancia - ganancia_base) / abs(ganancia_base) * 100, 1
)

print(resultados_precio, row.names = FALSE)

# -- Escenario 2: Variación en las ventas --------------------

cat("\n📦 SENSIBILIDAD A LAS VENTAS\n")
cat("──────────────────────────────────\n")

resultados_ventas <- data.frame(
  Variacion_pct = variaciones,
  Ventas_nuevas = round(ventas_base * (1 + variaciones/100)),
  Ganancia      = sapply(variaciones, function(v) {
    v_nuevo <- ventas_base * (1 + v/100)
    round(v_nuevo * (precio_base - costo_var_base) - costo_fijo_base)
  })
)
resultados_ventas$Impacto <- round(
  (resultados_ventas$Ganancia - ganancia_base) / abs(ganancia_base) * 100, 1
)

print(resultados_ventas, row.names = FALSE)

# -- Escenario 3: Matriz de escenarios (precio x ventas) -----

cat("\n🗺️  MAPA DE ESCENARIOS (Ganancia mensual en $)\n")
cat("     Filas = variación en ventas | Columnas = variación en precio\n\n")

v_range <- c(-20, -10, 0, 10, 20)
p_range <- c(-20, -10, 0, 10, 20)

matriz <- outer(v_range, p_range, Vectorize(function(vv, vp) {
  v_nuevo <- ventas_base * (1 + vv/100)
  p_nuevo <- precio_base * (1 + vp/100)
  round(v_nuevo * (p_nuevo - costo_var_base) - costo_fijo_base)
}))

rownames(matriz) <- paste0("Ventas ", ifelse(v_range >= 0, "+", ""), v_range, "%")
colnames(matriz) <- paste0("Precio ", ifelse(p_range >= 0, "+", ""), p_range, "%")

print(matriz)

cat("\n⚠️  Celdas negativas = pérdida en ese escenario\n")

# -- Gráfico de tornado corregido ----------------------------

sensibilidades <- data.frame(
  variable = c("Precio de venta", "Volumen de ventas",
               "Costo variable", "Costo fijo"),
  impacto_positivo = c(
    ventas_base * (precio_base * 1.10 - costo_var_base) - costo_fijo_base,
    ventas_base * 1.10 * (precio_base - costo_var_base) - costo_fijo_base,
    ventas_base * (precio_base - costo_var_base * 0.90) - costo_fijo_base,
    ventas_base * (precio_base - costo_var_base) - costo_fijo_base * 0.90
  ),
  impacto_negativo = c(
    ventas_base * (precio_base * 0.90 - costo_var_base) - costo_fijo_base,
    ventas_base * 0.90 * (precio_base - costo_var_base) - costo_fijo_base,
    ventas_base * (precio_base - costo_var_base * 1.10) - costo_fijo_base,
    ventas_base * (precio_base - costo_var_base) - costo_fijo_base * 1.10
  )
)

# Ordenar de mayor a menor impacto
sensibilidades <- sensibilidades[
  order(sensibilidades$impacto_positivo - sensibilidades$impacto_negativo,
        decreasing = FALSE), ]   # FALSE para que el mayor quede arriba en horiz

# Calcular rango de cada variable
rango <- sensibilidades$impacto_positivo - sensibilidades$impacto_negativo

# Margen izquierdo ampliado para que entren las etiquetas completas
par(mar = c(5, 12, 4, 2))

barplot(
  rango,
  horiz     = TRUE,
  names.arg = sensibilidades$variable,
  col       = "#4CAF50",
  border    = "white",
  main      = "Diagrama de tornado — ±10% en cada variable",
  xlab      = "Rango de variación en ganancia ($)",
  las       = 1,
  xlim      = c(0, max(rango) * 1.15)
)

# Línea de referencia y etiquetas de valor
abline(v = 0, col = "gray40", lwd = 1.5)
text(rango, 1:nrow(sensibilidades) * 1.2 - 0.5,
     labels = paste0("$", round(rango)),
     pos = 4, cex = 0.85, col = "#1a5e1a")

cat("\n✅ Análisis de sensibilidad completado.\n")
cat("   Usá estos resultados para fundamentar tus decisiones\n")
cat("   en la defensa final del emprendimiento.\n\n")
