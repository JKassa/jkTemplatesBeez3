{{ 'stylesheet' | jhtml: 'css/style.css' }}

<div id="jk-cart-module" class="{{ class_sfx }}">
	<a href="{{ url_cart }}" class="button">
	  {{ '_' | jtext: 'MOD_JKASSA_CART_YOUR_CART' }}
	  ({{ quantity }})
	</a>
</div>