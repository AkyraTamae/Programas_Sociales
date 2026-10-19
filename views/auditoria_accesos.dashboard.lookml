- dashboard: tracking_ingreso_tableros
  title: "Auditoría de Ingresos a Tableros"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: "Historial de Accesos"
    name: "Historial de Accesos"
    model: system__activity
    explore: history
    type: table
    fields: [
      history.created_time,
      user.name,
      dashboard.title
    ]
    filters:
      # Filtramos para que solo muestre vistas a tableros reales
      history.source: 'Dashboard'
      dashboard.title: '-NULL'
    sorts: [history.created_time desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: false
