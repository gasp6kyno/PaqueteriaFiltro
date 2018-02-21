<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrar Artículo</title>
</head>
<body>
	<h1>Registrar Artículo</h1>
	
	<form action="LoginServlet/out" method="get">
		<table>
			<tr>
				<td><input type="submit" value="Salir" /></td>
			</tr>
		</table>
	</form>
	<form action="adminArticulo?action=register" method="post">
		<table border="1" align="center">
			<tr>
				<td>Origen:</td>
				<td><input id="origin-input" class="controls" type="text"
					placeholder="Introducir un origen" name="origen" /></td>
			</tr>
			<tr>
				<td>Destino:</td>
				<td><input id="destination-input" class="controls" type="text"
					placeholder="Introducir un destino" name="destino" /></td>
			</tr>
			<tr>
				<td>Paquete:</td>
				<td><select name="paquete">
						<option value="grande">Grande</option>
						<option value="mediano">Mediano</option>
						<option value="pequeño">Pequeño</option>
				</select></td>
			</tr>
			<tr>
				<td>Fecha:</td>
				<td><input type="date" name="fecha" /></td>
			</tr>
			<tr>
				<td>Remitente:</td>
				<td><input type="text" name="remitente" /></td>
			</tr>
			<tr>
				<td>Transportista:</td>
				<td><input type="text" name="transportista" /></td>
			</tr>
			<tr>
				<td>Precio:</td>
				<td><input type="text" name="precio" /></td>
			</tr>

		</table>
		<br>
		<table border="0" align="center">
			<tr>
				<td><input type="submit" value="Agregar" name="agregar"></td>
			</tr>
		</table>
		<script>
			function initMap() {
				var map = new google.maps.Map(document.getElementById('map'), {
					mapTypeControl : false,
					center : {
						lat : 33.8688,
						lng : 51.2195
					},
					zoom : 13
				});
				new AutocompleteDirectionsHandler(map);
			}
			/**
			 * @constructor
			 */
			function AutocompleteDirectionsHandler(map) {
				this.map = map;
				this.originPlaceId = null;
				this.destinationPlaceId = null;

				var originInput = document.getElementById('origen');
				var destinationInput = document.getElementById('destino');
				this.directionsService = new google.maps.DirectionsService;
				this.directionsDisplay = new google.maps.DirectionsRenderer;
				this.directionsDisplay.setMap(map);
				var originAutocomplete = new google.maps.places.Autocomplete(
						originInput, {
							placeIdOnly : true
						});
				var destinationAutocomplete = new google.maps.places.Autocomplete(
						destinationInput, {
							placeIdOnly : true
						});

				this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
				this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');
				this.map.controls[google.maps.ControlPosition.TOP_LEFT]
						.push(originInput);
				this.map.controls[google.maps.ControlPosition.TOP_LEFT]
						.push(destinationInput);
				this.map.controls[google.maps.ControlPosition.TOP_LEFT]
						.push(modeSelector);
			}
			// Sets a listener on a radio button to change the filter type on Places
			// Autocomplete.

			AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(
					autocomplete, mode) {
				var me = this;
				autocomplete.bindTo('bounds', this.map);
				autocomplete
						.addListener(
								'place_changed',
								function() {
									var place = autocomplete.getPlace();
									if (!place.place_id) {
										window
												.alert("Por favor, seleccione una opción de la lista desplegable.");
										return;
									}

								});
			};
			AutocompleteDirectionsHandler.prototype.route = function() {
				if (!this.originPlaceId || !this.destinationPlaceId) {
					return;
				}

				this.directionsService.route({
					origin : {
						'placeId' : this.originPlaceId
					},
					destination : {
						'placeId' : this.destinationPlaceId
					}

				});
			};
		</script>
		<!-- Recordad que lo que se escribe aquí abajo va con la KEY del proyecto propio de google -->
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0sSBpWehnnsYjdr8F4gBZsOOROk9gxYo&libraries=places&callback=initMap"
			async defer></script>

	</form>
</body>
</html>