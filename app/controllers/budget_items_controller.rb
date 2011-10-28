class BudgetItemsController < ApplicationController
  # GET /budget_items
  # GET /budget_items.xml
  def index
    @budget_items = BudgetItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @budget_items }
    end
  end

  # GET /budget_items/1
  # GET /budget_items/1.xml
  def show
    @budget_item = BudgetItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @budget_item }
    end
  end

  # GET /budget_items/new
  # GET /budget_items/new.xml
  def new
    @budget_item = BudgetItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @budget_item }
    end
  end

  # GET /budget_items/1/edit
  def edit
    @budget_item = BudgetItem.find(params[:id])
  end

  # POST /budget_items
  # POST /budget_items.xml
  def create
    @budget_item = BudgetItem.new(params[:budget_item])

    respond_to do |format|
      if @budget_item.save
        format.html { redirect_to(@budget_item, :notice => 'Budget item was successfully created.') }
        format.xml  { render :xml => @budget_item, :status => :created, :location => @budget_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @budget_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /budget_items/1
  # PUT /budget_items/1.xml
  def update
    @budget_item = BudgetItem.find(params[:id])

    respond_to do |format|
      if @budget_item.update_attributes(params[:budget_item])
        format.html { redirect_to(@budget_item, :notice => 'Budget item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @budget_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_items/1
  # DELETE /budget_items/1.xml
  def destroy
    @budget_item = BudgetItem.find(params[:id])
    @budget_item.destroy

    respond_to do |format|
      format.html { redirect_to(budget_items_url) }
      format.xml  { head :ok }
    end
  end
end
