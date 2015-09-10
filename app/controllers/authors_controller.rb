class AuthorsController < AdminController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @author_books = Book.where(author_id: @author.id)
  end
#dnevnik: kak vybrat vse knigi avtora po id
  # est mnogo sposobov eto sdelat, no ya vybral where
  #takje, mojno poslednie sdelat tak: Book.order(:created_at :desc).limit(10)
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save

      upload_picture

      redirect_to authors_path
    else
      render 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)

      upload_picture

      redirect_to author_path
    else
      render 'new'
    end
  end

  def destroy
    @author = Author.destroy(params[:id])

    redirect_to authors_path
  end

  def upload_picture
    uploaded_file = params[:author][:picture]

    if !uploaded_file.nil?
      new_file_path = Rails.root.join('public', 'uploads', @author.id.to_s)

      File.open(new_file_path, 'wb') do |file|
        file.write uploaded_file.read
      end
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :bio)
  end
end
