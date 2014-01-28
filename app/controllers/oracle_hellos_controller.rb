class OracleHellosController < ApplicationController
  rescue_from ActiveRecord::ConnectionNotEstablished, with: :active_record_error
  rescue_from ActiveRecord::ConnectionTimeoutError, with: :active_record_error_timeout
  # GET /oracle_hellos
  # GET /oracle_hellos.json
  def index
    #@oracle_hellos = OracleHello
    #@oracle_hellos = params[:filter]
    
    if statusVPN("status") == "true" 
      begin
       ActiveRecord::Base.establish_connection({adapter: "oracle_enhanced",
        database: '',
        username: '',
        password: '',
        host: '',
        port: ''})
      rescue ActiveRecord::ConnectionTimeoutError
         flash[:notice] = "ActiveRecord::ConnectionTimeoutError_index"
      end  
    end
    #flash[:notice] = ActiveRecord::Base.connection_config
      #OracleHello.oracle_establish_connection unless OracleHello.connected?
    
 
    ware = params[:ware].to_i
        
    if params[:filter] == "" && ware == 0 || params[:filter] == nil || params[:ware] == nil
      flash[:notice] = "Enter filter"
      @oracle_hellos = nil
    else
    
      if ActiveRecord::Base.connection_config[:adapter] == "oracle_enhanced"
        if ware != 0
          @oracle_hellos = OracleHello.find_by_sql(OracleHello.question_code_wares(ware))
        else
          @oracle_hellos = OracleHello.find_by_sql(OracleHello.question(params[:filter]))
        end
      end
      
    end
    
    
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @oracle_hellos }
    end
  end

  # GET /oracle_hellos/1
  # GET /oracle_hellos/1.json
  def show
    #@oracle_hello = OracleHello.find(params[:id])
    #@oracle_hello = OracleHello.find(params[:filter])
    @oracle_hello = params[:filter]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @oracle_hello }
    end
  end
  
  #GET /oracle_hellos/vpn
  def vpn
    
    case params[:VPN]
     when "VPN:off [ON]"
      statusVPN "on"      
     when "VPN:on [OFF]"
      #OracleHello.remove_connection
      ActiveRecord::Base.establish_connection(adapter: 'sqlite3',
        database: 'db/development.sqlite3',
        pool: '5',
        timeout: '5000'      
      )
      statusVPN "off"
     when "Thinking"
      statusVPN "status"
    else
      
    end    
     
    
    respond_to do |format|
    
      format.html { redirect_to :back }
    end  
    
  end
  
  protected 
  
  def active_record_error
    flash[:notice] = "ActiveRecord::ConnectionNotEstablished"
  end
  
  def active_record_error_timeout
    flash[:notice] = "ActiveRecord::ConnectionTimeoutError"
  end

  # GET /oracle_hellos/new
  # GET /oracle_hellos/new.json
  #def new
  #  @oracle_hello = OracleHello.new

  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @oracle_hello }
  #  end
  #end

  # GET /oracle_hellos/1/edit
  #def edit
  #  @oracle_hello = OracleHello.find(params[:id])
  #end

  # POST /oracle_hellos
  # POST /oracle_hellos.json
  #def create
  #  @oracle_hello = OracleHello.new(params[:oracle_hello])

  #  respond_to do |format|
  #    if @oracle_hello.save
  #      format.html { redirect_to @oracle_hello, notice: 'Oracle hello was successfully created.' }
  #      format.json { render json: @oracle_hello, status: :created, location: @oracle_hello }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @oracle_hello.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # PUT /oracle_hellos/1
  # PUT /oracle_hellos/1.json
  #def update
  #  @oracle_hello = OracleHello.find(params[:id])

  #  respond_to do |format|
  #    if @oracle_hello.update_attributes(params[:oracle_hello])
  #      format.html { redirect_to @oracle_hello, notice: 'Oracle hello was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @oracle_hello.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /oracle_hellos/1
  # DELETE /oracle_hellos/1.json
  #def destroy
  #  @oracle_hello = OracleHello.find(params[:id])
  #  @oracle_hello.destroy

  #  respond_to do |format|
  #    format.html { redirect_to oracle_hellos_url }
  #    format.json { head :no_content }
  #  end
  #end
end

