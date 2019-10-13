class Admin::UserSessionsController < ApplicationController



#(仮)

	skip_before_action :require_login, except: [:destroy], raise: false

    def new
       省略
    end

    def create
　　　　省略
    end

    def destroy
　　　　省略
    end

end
