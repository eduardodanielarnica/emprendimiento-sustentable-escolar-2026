# ============================================================
#  SCRIPT 02 · Modelo Financiero
#  Materia: Producción · ORT Argentina 2026
#  Docente: Eduardo Daniel Arnica
# ============================================================
#
#  Este script calcula el punto de equilibrio y proyecta
#  el flujo de caja de tu emprendimiento para 12 meses.
#
# ============================================================

# -- Paso 1: Parámetros del emprendimiento -------------------
#            ↓  COMPLETÁ CON LOS DATOS DE TU GRUPO  ↓

nombre_emprendimiento <- "Mi Emprendimiento"
precio_venta          <- 350    # precio por unidad (en pesos)
costo_variable        <- 120    # costo directo por unidad
costo_fijo_mensual    <- 5000   # alquiler, servicios, etc.
inversion_inicial     <- 20000  # capital necesario para arrancar

# Ventas proyectadas mes a mes (completar con tu estimación)
ventas_proyectadas <- c(20, 30, 35, 45, 50, 55,
                        60, 65, 70, 75, 80, 90)

# -- Paso 2: Punto de equilibrio -----------------------------

margen_contribucion <- precio_venta - costo_variable
punto_equilibrio    <- ceiling(costo_fijo_mensual / margen_contribucion)

cat("════════════════════════════════════════\n")
cat(" MODELO FINANCIERO —", nombre_emprendimiento, "\n")
cat("════════════════════════════════════════\n\n")
cat("💰 Precio de venta:       $", precio_venta, "\n")
cat("📦 Costo variable/unidad: $", costo_variable, "\n")
cat("📊 Margen de contribución: $", margen_contribucion,
    sprintf("(%.0f%%)\n", margen_contribucion/precio_venta*100))
cat("🏠 Costos fijos/mes:      $", costo_fijo_mensual, "\n")
cat("⚖️  Punto de equilibrio:  ", punto_equilibrio, "unidades/mes\n\n")

# -- Paso 3: Flujo de caja proyectado (12 meses) -------------

meses <- 1:12

ingresos  <- ventas_proyectadas * precio_venta
cv_total  <- ventas_proyectadas * costo_variable
resultado <- ingresos - cv_total - costo_fijo_mensual

flujo_acumulado <- cumsum(resultado) - inversion_inicial

flujo_df <- data.frame(
  Mes       = meses,
  Ventas    = ventas_proyectadas,
  Ingresos  = ingresos,
  Costos    = cv_total + costo_fijo_mensual,
  Resultado = resultado,
  Acumulado = flujo_acumulado
)

cat("📅 PROYECCIÓN 12 MESES\n")
cat("──────────────────────────────────────────────────────\n")
print(flujo_df, row.names = FALSE)

# Mes en que se recupera la inversión
recuperacion <- which(flujo_acumulado >= 0)[1]
if (!is.na(recuperacion)) {
  cat("\n✅ Recuperación de inversión: mes", recuperacion, "\n")
} else {
  cat("\n⚠️  La inversión no se recupera en el primer año.\n")
  cat("   Revisá el precio o los costos fijos.\n")
}

# -- Paso 4: Gráficos ----------------------------------------

par(mfrow = c(1, 2))

# Gráfico 1: Punto de equilibrio
unidades_rango <- 0:120
ingresos_rango <- unidades_rango * precio_venta
costos_rango   <- costo_fijo_mensual + unidades_rango * costo_variable

plot(unidades_rango, ingresos_rango,
     type = "l", col = "#4CAF50", lwd = 2,
     xlab = "Unidades vendidas",
     ylab = "Pesos ($)",
     main = "Punto de equilibrio")
lines(unidades_rango, costos_rango, col = "#F44336", lwd = 2)
abline(v = punto_equilibrio, lty = 2, col = "gray40")
legend("topleft",
       legend = c("Ingresos", "Costos totales",
                  paste("PE =", punto_equilibrio, "u.")),
       col = c("#4CAF50", "#F44336", "gray40"),
       lty = c(1, 1, 2), lwd = 2, cex = 0.8)

# Gráfico 2: Flujo acumulado
plot(meses, flujo_acumulado,
     type = "b", pch = 19,
     col  = ifelse(flujo_acumulado >= 0, "#4CAF50", "#F44336"),
     xlab = "Mes",
     ylab = "Pesos ($)",
     main = "Flujo de caja acumulado")
abline(h = 0, lty = 2, col = "gray40")
abline(h = -inversion_inicial, lty = 3, col = "gray60")

par(mfrow = c(1, 1))

cat("\n✅ Modelo financiero completado.\n")
