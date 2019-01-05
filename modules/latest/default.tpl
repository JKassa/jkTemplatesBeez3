{{ 'stylesheet' | jhtml: 'css/style.css' }}
{% assign btns = 0 | plus: readmore, to_cart, to_wishlist, to_compare %}
<div class="jkassa jk-latest-module {{ class_sfx }}">
	{% if products %}
	  {% case layout %}
		{% when 'blocks' %}
		  {% include 'modules/latest/blocks' %}
		{% when 'carousel' %}
		  <style type="text/css">
			.jk-latest-module .carousel-inner {
				margin-left: 35px;
				margin-right: 35px;
				width: auto;
			}
			.jk-latest-module .carousel-control {
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
			.jk-latest-module .carousel-control.right { right: 0; }
			.jk-latest-module .carousel-indicators .active { background-color: #ccc; }
			.jk-latest-module .carousel-indicators li { background-color: #265a82; }
			@media (min-width: 768px) and (max-width: 979px) {
				.jk-latest-module .carousel-inner {
					margin-left: auto;
					margin-right: auto;
					width: 100%;
				}
				.jk-latest-module .control-box {
					display: block;
					text-align: center;
				}
				.jk-latest-module .carousel-control {
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
	  <div class="alert alert-block">
		{{ '_' | jtext: 'JNONE' }}
	  </div>
	{% endif %}
</div>