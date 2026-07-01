connection: "broxel217_broxelcore"

include: "/views/**/*.view.lkml"

datagroup: broxel217_broxelcore_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: broxel217_broxelcore_default_datagroup

explore: broxel_217_broxelcore_remesa {
  always_filter: {
    filters: [broxel_217_broxelcore_remesa.fecha_creacion_date: "2 months"]
  }
}
