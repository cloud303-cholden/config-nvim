local M = {}

M.settings = {
  xml = {
    completion = {
      autoCloseTags = true,
    },
    fileAssociations = {
      {
        systemId = "/home/ch/repos/odoo/odoo/import_xml.rng",
        pattern = "**/*.xml",
      },
      {
        systemId = "/home/ch/repos/odoo/odoo/addons/base/rng/common.rng",
        pattern = "**/*.xml",
      },
      {
        systemId = "/home/ch/repos/odoo/odoo/addons/base/rng/activity_view.rng",
        pattern = "**/*.xml",
      },
      {
        systemId = "/home/ch/repos/odoo/odoo/addons/base/rng/calendar_view.rng",
        pattern = "**/*.xml",
      },
      {
        systemId = "/home/ch/repos/odoo/odoo/addons/base/rng/graph_view.rng",
        pattern = "**/*.xml",
      },
      {
        systemId = "/home/ch/repos/odoo/odoo/addons/base/rng/pivot_view.rng",
        pattern = "**/*.xml",
      },
      {
        systemId = "/home/ch/repos/odoo/odoo/addons/base/rng/search_view.rng",
        pattern = "**/*.xml",
      },
      {
        systemId = "/home/ch/repos/odoo/odoo/addons/base/rng/tree_view.rng",
        pattern = "**/*.xml",
      },
    },
  },
} 

return M.settings
