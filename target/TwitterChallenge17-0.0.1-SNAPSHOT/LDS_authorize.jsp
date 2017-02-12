
<!DOCTYPE html>
<html xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <title>Salesforce Lightning Design System Twitter Authorization Module</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="styles/salesforce-lightning-design-system-vf.min.css"  type="text/css">
</head>

<body>


  <!-- REQUIRED SLDS WRAPPER -->
  <div class="TDJ">

    <!-- MASTER HEAD -->
    <p class="slds-text-heading--label slds-m-bottom--small">
      	Salesforce Lightning Design System Twitter Authorization Module
    </p>
    <!-- / MASTER HEAD -->

	<!-- PAGE HEADER -->
	<div class="slds-page-header" role="banner">
		<div class="slds-grid">
			<div class="slds-col slds-has-flexi-truncate">
			
			    <!-- FORM -->
			    <form action="TwitterSignInServlet" method="GET" class="slds-form--stacked" id="add-account-form">
			      <!-- BOXED AREA -->
			      <fieldset class="slds-box slds-theme--default slds-container--small">			
			        <div class="slds-form-element">
			          <label >Hello ! Please authorize my app to view your tweets .. </label>
			        </div>
			        <button class="slds-button slds-button--brand slds-m-top--medium" type="submit">Authorize</button>
			      </fieldset>
			      <!-- / BOXED AREA -->
			    </form>
			    <!-- FORM -->
			
			</div>
	  </div>
	  
	</div>
	<!-- / PAGE HEADER --

<!-- FOOTER -->
<footer role="contentinfo" class="slds-p-around--large">
  <!-- LAYOUT GRID -->
  <div class="slds-grid slds-grid--align-spread">
  	<p></p>
    <p class="slds-col">&copy; Deepa </p>
  </div>
  <!-- / LAYOUT GRID -->
</footer>
<!-- / FOOTER -->

  </div>
  <!-- / REQUIRED SLDS WRAPPER -->
	
	</body>
</html>