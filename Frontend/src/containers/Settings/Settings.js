import React, {Component} from 'react';

import Auxilirian from '../../hoc/Auxilirian/Auxilirian';
import Form from '../../components/UI/Form/Form';

class Settings extends Component{

    registrationHandler = ( event ) => {
        event.preventDefault();
        console.log('Wyslalem formularz');

        // axios.post( '/orders.json', order )
        //     .then( response => {
        //         this.setState( { loading: false } );
        //         this.props.history.push( '/' );
        //     } )
        //     .catch( error => {
        //         this.setState( { loading: false } );
        //     } );
    };

    render(){

        const formData = {
            registrationForm: {
                username: {
                    elementType: 'input',
                    elementConfig: {
                        type: 'text',
                        placeholder: 'Your Name'
                    },
                    value: '',
                    validation: {
                        required: true
                    },
                    valid: false,
                    touched: false
                },
                email: {
                    elementType: 'input',
                    elementConfig: {
                        type: 'email',
                        placeholder: 'Your E-Mail'
                    },
                    value: '',
                    validation: {
                        required: true,
                        isEmail: true
                    },
                    valid: false,
                    touched: false
                },
                password: {
                    elementType: 'input',
                    elementConfig: {
                        type: 'text',
                        placeholder: 'Enter password'
                    },
                    value: '',
                    validation: {
                        required: true
                    },
                    valid: false,
                    touched: false
                },
                passwordAgain: {
                    elementType: 'input',
                    elementConfig: {
                        type: 'text',
                        placeholder: 'Enter password again'
                    },
                    value: '',
                    validation: {
                        required: true
                    },
                    valid: false,
                    touched: false
                }
            },
            title: 'Formularz rejestracji',
            formIsValid: false
        };

        return(
            <Auxilirian>
                Example of form component
                <div>
                    <Form
                        formData={formData}
                        onSubmit={this.registrationHandler}
                    />
                </div>


                <button
                    >
                    ORDER NOW</button>

            </Auxilirian>
        )
    }

}

export default Settings;