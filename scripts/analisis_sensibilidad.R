# Analisis de sensibilidad para emprendimiento escolar
# Materia Produccion - ORT

# Costos fijos (inversion inicial)
costo_fijo <- 12000

# Costo variable por unidad
costo_var <- 150

# Precios a probar
precios <- c(250, 300, 350, 400, 450, 500)

print("=== ANALISIS DE PUNTO DE EQUILIBRIO ===")

for(precio in precios) {
  unidades <- costo_fijo / (precio - costo_var)
  print(paste("Precio $", precio, "-> necesitas", round(unidades, 0), "unidades"))
}

print("=== RECOMENDACION ===")
print("Precio sugerido: $350")


