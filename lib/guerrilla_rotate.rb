module ActionController
	class Base
    cattr_accessor :guerrilla_paths
    def self.guerrilla_rotate( *actions )
      @@guerrilla_paths = {}
      actions.each do |a|
        catch (:next_path) do
          view_paths.each do |vp|
            Dir.chdir(vp) do
              gpath = _gr_gpath(controller_name, a)
              guerrilla_paths[gpath] = Dir.glob(gpath + '*') and
                throw :next_path
            end
          end
        end
      end
    end

		protected
			alias_method :gr_original_render_for_file, :render_for_file
			def render_for_file( template_path, *others )
        gpath = _gr_gpath(controller_name, action_name)
				if guerrilla_paths.has_key?(gpath)
					ga = guerrilla_paths[gpath]
          session[:guerrilla_index] ||= {}
          template_path = ga[ session[:guerrilla_index][gpath] ||= rand(ga.size)]
          adjusted_action = template_path[%r{[^/]+(?=\.#{@template.template_format}\.)}]
          if defined? Rubaidh::GoogleAnalytics
            Rubaidh::GoogleAnalytics.override_trackpageview =
              url_for(
                :controller => controller_name,
                :action => adjusted_action,
                :only_path => true)
          end
				end
				gr_original_render_for_file( template_path, *others )
			end

    private
      def self._gr_gpath(c,a)
        File.join(c.to_s, a.to_s)
      end
      def _gr_gpath(*p); self.class._gr_gpath(*p); end
	end
end
