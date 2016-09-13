module ApplicationHelper
	Spree::BaseHelper.module_eval do
    	def taxons_tree(root_taxon, current_taxon, max_level = 1, count = 0)
  			return '' if max_level < 1 || root_taxon.children.empty?
  				if count == 0 
  					parent_class = 'dropdown'
  					count += 1
  				else
  					parent_class = 'dropdown-menu'
  				end
  				content_tag :ul, class: parent_class do
    				root_taxon.children.map do |taxon|
                if (current_taxon && current_taxon.self_and_ancestors.include?(taxon))
                  css_class = 'top-level'
                  css_active = 'active'
                else
                  css_class = ''
                  css_active = ''
                end
      					content_tag :li, class: css_class do
      						btn = link_to(taxon.name, seo_url(taxon), class: "dropdown-toggle " + css_active )

      						btn.html_safe + taxons_tree(taxon, current_taxon, max_level - 1, count)      					
      					end     				
    				end.join("\n").html_safe
  				end
		end
	end
end
