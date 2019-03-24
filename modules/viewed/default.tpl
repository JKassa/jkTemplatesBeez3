{{ 'stylesheet' | jhtml: 'css/style.css' }}
<div class="jkassa jk-viewed-module {{ class_sfx }}">
	{% if products %}
	  {% capture block_height %}{% if block_height %}height: {{ block_height }}px;{% endif %}{% endcapture %}
	  {% capture img_height %}{% if img_height %}max-width: 100%; max-height: {{ img_height }}px;{% endif %}{% endcapture %}
	  {% assign btns = 0 | plus: readmore, to_cart, to_wishlist, to_compare %}
	  {% case layout %}
		{% when 'blocks' %}
		  {% include 'modules/latest/blocks' %}
		{% when 'carousel' %}
		  <style type="text/css">
		  .jk-viewed-module .carousel-inner {
			  margin-left: 35px;
			  margin-right: 35px;
			  width: auto;
		  }
		  .jk-viewed-module .carousel-control {
			  background: #ccc;
			  border: 2px solid #265a82;
			  color: #265a82;
			  font-size: 40px;
			  font-weight: 100;
			  height: 26px;
			  left: auto;
			  line-height: 18px;
			  width: 26px;
		  }
		  .jk-viewed-module .carousel-control.right { right: 0; }
		  .jk-viewed-module .carousel-indicators .active { background-color: #ccc; }
		  .jk-viewed-module .carousel-indicators li { background-color: #265a82; }
		  @media (min-width: 768px) and (max-width: 979px) {
			  .jk-viewed-module .carousel-inner {
				  margin-left: auto;
				  margin-right: auto;
				  width: 100%;
			  }
			  .jk-viewed-module .control-box {
				  display: block;
				  text-align: center;
			  }
			  .jk-viewed-module .carousel-control {
				  display: inline-block;
				  position: static;
			  }
		  }
		  </style>
		  {% include 'modules/latest/carousel' %}
		{% else %}
		  {% include 'modules/latest/list' %}
	  {% endcase %}
	{% else %}
	  <strong>
		{{ message }}
	  </strong>
	{% endif %}
</div>