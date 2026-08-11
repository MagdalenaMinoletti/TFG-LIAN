# Análisis de Percepción y Competitividad: United Airlines

**Trabajo Final de Carrera – Licenciatura en Analítica de Negocios (UCEMA)**
Autora: Magdalena Minoletti

## Problema de negocio

La industria aérea es altamente competitiva y la percepción de los pasajeros impacta directamente en la reputación y el éxito de las aerolíneas. United Airlines presenta una brecha significativa frente a su competencia: entre 2012 y 2018 su puntaje promedio de satisfacción fue de 4,65 vs. 5,65 del promedio de la industria, y actualmente su calificación en Skytrax es de 3/10. Este proyecto busca identificar, a partir de datos reales, qué áreas debería priorizar la aerolínea para reducir esa brecha y mejorar su posición competitiva.

## Qué hice

El proceso se organizó en cuatro etapas: recolección de datos, limpieza y transformación, análisis exploratorio y modelado.

- **Recolección de datos**: ~131.900 reseñas de Skytrax (2012-2018) y ~14.600 tweets (2015) mencionando a aerolíneas nacionales de EE.UU. (United, Delta, American, Southwest, Alaska, Virgin America, Spirit, Frontier, JetBlue), más una base de aeropuertos para enriquecer el análisis geográfico.
- **Limpieza y transformación**: imputación de valores faltantes, extracción de rutas desde el texto de las reseñas, normalización de texto, balanceo de clases (oversampling) y anonimización de datos.
- **Análisis de sentimientos**: comparación de VADER (léxico) vs. RoBERTa/BERT (transformer) sobre las reseñas de Skytrax, evaluando cuál captura mejor matices como sarcasmo o quejas implícitas.
- **Modelado de tópicos**: LDA y BERTopic para identificar los temas más recurrentes en reseñas positivas y negativas.
- **Modelos de clasificación**: Regresión Logística vs. XGBoost (con embeddings de texto + PCA) para predecir si un pasajero recomendaría la aerolínea.
- **Análisis de sentimientos en Twitter**: comparación de 4 algoritmos (XGBoost, Random Forest, Regresión Logística, Gradient Boosting) usando embeddings de `all-MiniLM-L6-v2`.

Técnicas: NLP (VADER, BERT/RoBERTa, LDA, BERTopic, embeddings), aprendizaje supervisado (Regresión Logística, XGBoost, Random Forest, Gradient Boosting) y no supervisado (PCA).

## Resultados clave

- **BERT superó a VADER** en la clasificación de sentimientos: capturó mejor la frustración implícita y el sarcasmo en reseñas donde VADER las etiquetaba erróneamente como neutrales.
- **Correlación del 81%** entre reseñas positivas (según BERT) y probabilidad de recomendación del pasajero.
- **Las variables con mayor peso en la recomendación** fueron, en orden: relación calidad-precio (0,89), servicio en cabina (0,79), comodidad de los asientos (0,75), servicio en tierra (0,69) y comida/bebidas (0,58).
- **Los modelos de clasificación de recomendación** alcanzaron ~97% de accuracy: XGBoost con embeddings de texto superó levemente a la Regresión Logística, destacándose en AUC (0,99 vs. 0,97).
- **Para Twitter, la Regresión Logística fue el modelo más efectivo** (98% accuracy, AUC 0,997), superando a XGBoost, Random Forest y Gradient Boosting.
- **Los tópicos negativos de United Airlines** (retrasos, cancelaciones, falta de comunicación) coinciden con los de su competencia (American, Delta), lo que indica que resolverlos representaría una ventaja competitiva real, no solo un problema del sector.

## Recomendaciones estratégicas

1. Priorizar mejoras en relación calidad-precio, servicio en cabina y comodidad de asientos, por ser las variables con mayor correlación con la recomendación del pasajero.
2. Hacer fine-tuning de BERT con datos específicos de United Airlines para afinar la identificación de tópicos de satisfacción/insatisfacción.
3. Implementar el modelo de sentimientos de Twitter como herramienta de monitoreo en tiempo real, con alertas automáticas ante picos de comentarios negativos (por ejemplo, en vuelos con retrasos).
4. A futuro: integrar los modelos con sistemas CRM, incorporar datos en tiempo real vía API de Twitter, y complementar con encuestas directas a pasajeros para validar los hallazgos.

## Estructura del repositorio

El código incluye explicaciones en cada sección del proceso: recolección de datos, limpieza, análisis exploratorio, y desarrollo de los distintos modelos (sentimiento, tópicos, clasificación).

## Documento completo

El desarrollo completo, marco teórico, metodología detallada y conclusiones están disponibles en el documento de tesis (PDF) que acompaña este repositorio.
