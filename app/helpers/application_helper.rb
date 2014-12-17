module ApplicationHelper

	def errors_messages_for(object)
		render :partial => 'shared/form_errors', :locals => {:object => object}
	end

	def sum_qty(object)
		t_qty = 0

		object.each do |obj|
		t_qty += obj.to_i
		end

		return t_qty
	end

end
