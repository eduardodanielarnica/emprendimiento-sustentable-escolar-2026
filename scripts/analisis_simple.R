# ============================================================
#  HITO 1 · Análisis de Mercado
#  Equipo A — Huerta Hidropónica Escolar
#  Integrantes: Lucía A., Martín B., Sofia C.
# ============================================================

# -- Nuestro emprendimiento ----------------------------------
nombre <- "Huerta Hidropónica ORT"
precio_venta   <- 320   # precio por kit mensual
costo_variable <- 95    # semillas + nutrientes + packaging
costo_fijo     <- 4500  # alquiler del espacio + servicios

# -- Punto de equilibrio ------------------------------------
margen <- precio_venta - costo_variable
pe     <- ceiling(costo_fijo / margen)
cat("Punto de equilibrio:", pe, "kits/mes\n")

# -- Segmentación -------------------------------------------
segmentos <- data.frame(
  grupo      = c("Familias", "Restaurantes", "Colegios"),
  porcentaje = c(50, 30, 20)
)
pie(segmentos$porcentaje,
    labels = paste0(segmentos$grupo, " ", segmentos$porcentaje, "%"),
    col    = c("#4CAF50", "#2196F3", "#FF9800"),
    main   = paste("Mercado —", nombre))
