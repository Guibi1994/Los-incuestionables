# Los incuestionables

El presente proyecto busca realizar un análisis detallado de las declaraciones de renta de los congresistas de Colombia, de cara a lo establecido en la [Ley 2013 de 2019](https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=104572 "haga clic acá para ver la ley") bajo la cual se obliga, entre otros funciones del estado, a cada congresita a entregar **anualmente** ante la Función Pública los siguientes documentos:

-   Copia digital de la declaración de renta.

-   Publicación proactiva de la declaración de bienes y rentas y regitro de conflicots de ínteres.

La discriminación entre estos documentos y la periodicidad bajo la cual tiene que ser aportados se encuetran en los artículos de *2do* y *3ro* (respectivamente) de la citada ley. Adicionalmente, estos documentos estan disuestos en el portal de la Función Pública, específicamente en el [Aplicativo por la Integridad Pública](https://www.funcionpublica.gov.co/fdci/ "haga click aquí para entrar al aplicativo") en donde pueden consultarse.

## I. Análisis inicial (generalidades)

En Colombia las declaraciones de renta se presentan el año subsiguietne: Es decir, la declaracion de renta del 2019 se presenta en el año 2020. De este modo dado que la Ley en cuestion entro en vigencia el 30 de diciembre de 2019, cada congresista (y en general cada funcionario y/o persona obligada por esta ley) debería tener al menos 3 registros de cada uno de los documetnos antes mencioandos. (los registros del 2019, 2020 y 2021, en donde se registran las rentas, bienes y conflictos de interes de los años 2018, 2019 y 2020 respectivamente). Esto, teniendo en cuenta la fecha del presente análisis.

Otra aspecto importante es que en el artículo 2 parágrado 1 de la Ley 2013 de 2019, estabelce que este registro es necesario tanto para la posesión en el cargo como para el ejercimiento y el retiro del mismo.

-   ***PARÁGRAFO  1.** La publicación de esta información será requisito para posesionarse, ejercer y retirarse del cargo. A quienes no aplica el ingreso y retiro del cargo, será requisito antes, durante y al término del ejercicio de la función pública, prestación de servicios públicos o administración de bienes o recursos públicos*.

## Notas

-   Número de radicado derecho de petición dian: 202282140100081585 (21 jul 2022) - [consultar aquí](https://muisca.dian.gov.co/WebSolicitudesexternas/DefInicioSolicitudNS.faces)

-   Derecho de petición sobre cédulas, partidos y votos de congresistas electos 2018-2022 y 2022-2026 fue enviado el 20 jul 2022.

# Estado (`r Sys.Date()` )

-   Se extrajo la base cruda del portal de Función Pública

-   Se econtro lo siguiente respecto a estos registros:

    -   Casi todos los regstros tiene los tres documentos para el primer año en el que se emitió la ley 2013 de 2019. Estos archivos estan por lo general en un archivo .*zip* con nombres regulares.

    -   No todas las declaraciones de renta estan en PDF digital, algunas son PDF de imágenes capturadas con el celular

    -   Las declaraciones juramentadas tienden (en su mayoria) a seguir un formáto único. Lo mismo sucede con las declaraciones de renta, pues son formatos aparentemente regulares de la DIAN. Esto quiere deicr que es necesario realizar un algórimo individual para cada año de análisis. Es necesario precaución con formatos digitales aprenemente iguales pero con diferncias pequeñas que pueden afectar el desempeño del algóritmo de extracción.

    -   Se enviaron los derechos de petición sobre las céudulas y partidos de los congresistas al Congreso de la República y a la Registraduria nacional. Tambien se envio derecho de petición a la DIAN sobre las declraciones de renta oficales y digitales de los congresistas electos de los últimos dos periodos legislativos.

    -   Se realizó el webscrapping de la página del senado. Aunque preferentemente se usara la información conseguida a través de los derechos de petición, el algórimo puede ser la base para extraer información sobre proyectos de ley.

zz

# 

# 
