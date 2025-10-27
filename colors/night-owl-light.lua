vim.g.colors_name = "night-owl-light"

package.loaded["night-owl"] = nil
package.loaded["night-owl.config"] = nil
package.loaded["night-owl.theme"] = nil
package.loaded["night-owl.palette"] = nil
package.loaded["night-owl.palette-light"] = nil

require("night-owl").setup({
	background = "light"
})

require("night-owl")._load()