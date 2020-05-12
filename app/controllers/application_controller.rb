class ApplicationController < ActionController::Base
	include CurrentUserConcern
	include DeviseWhitelist
end
