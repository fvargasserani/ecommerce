
# RESPUESTA 1

Ver imagen ecommerce_diagram.png en la carpeta principal.

# RESPUESTA 6

Revisar en app/views/products los documentos index y show para ver la lista de productos del catalogo. Se puede aplicar Bootstrap para mejorar el diseno.

# RESPUESTA 7

En lugar de agregar un atributo extra, se debería eliminar el atributo "price" del modelo OrderVariant (aka OrderItem) y pasarlo al modelo Variant. Esto, dado que el precio puede cambiar en función de la variante del producto. Por ejemplo, una polera talla L puede ser más cara que una polera talla S del mismo tipo, dado que usa más tela.


# RESPUESTA 8

1. Ver imagen ecommerce_diagram.png en la carpeta principal.

2. En la terminal, agregar el modelo Discount y referenciarlo a Payment:
rails g model Discount percentage:float amount:integer
rails g migration AddDiscountRefToPayment discount:references

3. En ambos modelos agregar referencias:
Modelo Discount: has_many :payments
Modelo Payment: belongs_to :discount

4. Instanciar @discount en el controlador de Payment.

5. En la vista index de Payment, escribir el codigo con condiciones 'if', tanto para validar el tipo de usuario (redes sociales o cliente especifico), como para validar el monto de compra. Codigo para usuarios especificos, por ejemplo ya registrados:

    if User.all.includes(current_user)

        if @discount.percentage == nil && @payment.total > 20000

            @payment.total - (@discount.amount)

        else

            @payment.total - (@discount.percentage)

        end

    else 

        if @discount.percentage == nil && @payment.total > 20000

            @payment.total - (@discount.amount)

        else

            @payment.total - (@discount.percentage)

        end

    end


# RESUMEN VIDEOS Y LECTURA

# PROFUNDIZANDO RELACIONES N A N

rails new ecommerce rails -d=prostgresql

rails db:create

rails g scaffold Category name

rails g scaffold Product name description:text stock:integer price:float sku

rails g migration CreateJoinTableProductCategory category product

Descomentar ambos index en la migracion creada

rails db:migrate

En ambos modelos agregar has_and_belongs_to_many

Agregar en el form de product un category check box (buscar codigo en la lectura)

Dentro de los strong_params de product agregare category_ids: []

Crear primero una categoria para poder ver al menos una en el form de product

Dentro de la carpeta db agregar una nueva carpeta llamada seeds. Dentro de seeds agregar los documentos products.rb y categories.rb. (buscar codigo para llenar estos docs en la lectura).

En el doc seed.rb daremos la instruccion para ejecutar todos los archivos dentro de la carpeta seed. 

rails db:seed

Instalar devise bajo el model Admin

En el archivo routes.rb agregar el helper de devise para la autenticacion de ciertas rutas (en lugar de hacerlo desde el controlador)

rails db:migrate

# DESARROLLO USANDO TDD

Crear ahora la autenticacion de devise para el modelo User

Por otro lado, crear el modelo de la orden de compra, Order.

rails g model Order user:references number total:float status . El atributo number es para entregar al usuario un numero distinto al index, asi no conocen el numero verdadero de la orden.

rails db:migrate

En test > fixtures hay documentos que cargaran datos para hacer las pruebas. Agregar los correos de los usuarios y admins para las pruebas.

En los test de los distintos modelos agregar las pruebas y ejecutarlas.

En el modelo Order agregar before_create :generate_number y definir el metodo generate_number y correr nuevamente el test.

Refactorizar test en caso de ser necesario.

rails g model OrderItem order:references product:references quantity:integer price:float 

rails db:migrate

Agregar relaciones has_many y belongs_to en los modelos

rails g controller Home index

integrar el CDN de Bootstrap

En la vista de Home index usar card decks de Bootstrap

Hacer más tests para el modelo Order

rails g controller Carts update show

Agregar before_action :authenticate_user!

En Home agregar un form para agregar productos al carro

En routes.rb agregar resource: cart , only: [:show, :update]

En el controlador definir metodo update, show y current_order

Crear la vista show del cart

# INTEGRACIÓN DE MEDIOS DE PAGO

Crear cuenta en developers.paypal.com

Usar la cuenta sandbox que es con dinero ficticio.

Usar los usuarios buyer y facilitador para hacer simulaciones.

Obtener las API credentials.

rails g model PaymentMethods name code

rails g model Payment order:references payment_method:references status total:float token

rails db:migrate

Agregar has_many en los modelos

Agregar payment_methods.rb en la carpeta seeds

Agregar la gema active merchant

Modificar la configuracion en el entorno de desarrollo agregando el bloque para antes de inicializar, con las API credentials

 Agregar rutas del medio de pago en el carro de compras. 
 
 Definir el metodo de pago en el controlador del carro de compras. Ademas, configurar un metodo de retorno en caso que el pago sea rechazado.

En la vista de carro de compras hacer funcional el boton de pago a traves de un metodo post.

