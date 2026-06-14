# ============================================
# VERSIÓN SIMPLE CON GRÁFICO
# SOLO CAMBIÁ 2 NÚMEROS
# ============================================

# 🔧 CAMBIÁ ESTOS 2 NÚMEROS SOLAMENTE 🔧
costo_fijo <- 12000   # <- Poné tu inversión inicial
costo_var <- 150      # <- Poné tu costo por producto
# ============================================

# El resto lo hace el script solo
precios <- c(250, 300, 350, 400, 450, 500)
cantidades <- seq(10, 150, by = 10)

# === ANÁLISIS EN CONSOLA ===
cat("\n=== ANÁLISIS DE TU EMPRENDIMIENTO ===\n")
cat("Inversión inicial: $", costo_fijo, "\n")
cat("Costo por producto: $", costo_var, "\n\n")

for(precio in precios) {
  margen <- precio - costo_var
  if(margen > 0) {
    equilibrio <- ceiling(costo_fijo / margen)
    cat("💰 Precio $", precio, "→ necesitas vender", equilibrio, "unidades\n")
  } else {
    cat("❌ Precio $", precio, "→ imposible (precio menor al costo)\n")
  }
}

# === GRÁFICO ===
if(!require(ggplot2, quietly = TRUE)) {
  cat("\n⚠️ Para ver el gráfico, instalá ggplot2:\n")
  cat("   install.packages('ggplot2')\n")
} else {
  
  # Crear datos para el gráfico
  resultados <- data.frame()
  for(precio in precios) {
    margen <- precio - costo_var
    if(margen > 0) {
      for(cant in cantidades) {
        ganancia <- (precio - costo_var) * cant - costo_fijo
        resultados <- rbind(resultados, 
                           data.frame(Precio = paste0("$", precio),
                                      Unidades = cant,
                                      Ganancia = ganancia))
      }
    }
  }
  
  # Gráfico
  grafico <- ggplot(resultados, aes(x = Unidades, y = Ganancia, color = Precio)) +
    geom_line(size = 1.2) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "red", size = 1) +
    labs(title = "📈 ANÁLISIS DE RENTABILIDAD",
         subtitle = paste("Costo fijo: $", costo_fijo, " | Costo variable: $", costo_var),
         x = "Unidades vendidas",
         y = "Ganancia ($)",
         caption = "Línea roja = equilibrio (ganancia = 0)") +
    theme_minimal() +
    theme(legend.position = "bottom")
  
  print(grafico)
  
  cat("\n📊 GRÁFICO GENERADO\n")
  cat("   - Sobre la línea roja = GANANCIA\n")
  cat("   - Debajo de la línea roja = PÉRDIDA\n")
}
