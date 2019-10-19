import React, {Component} from 'react';

import Input from './Input/Input';
import classes from './Form.css';

class Form extends Component {

    constructor(props){
        super(props);
        this.state = props.formData;
    }

    checkValidity = (value, rules) => {
        let isValid = true;
        if (!rules) {
            return true;
        }

        if (rules.required) {
            isValid = value.trim() !== '' && isValid;
        }

        if (rules.minLength) {
            isValid = value.length >= rules.minLength && isValid
        }

        if (rules.maxLength) {
            isValid = value.length <= rules.maxLength && isValid
        }

        if (rules.isEmail) {
            const pattern = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
            isValid = pattern.test(value) && isValid
        }

        if (rules.isNumeric) {
            const pattern = /^\d+$/;
            isValid = pattern.test(value) && isValid
        }

        return isValid;
    };

    inputChangedHandler = (event, inputIdentifier) => {
        const updatedRegistrationForm = {
            ...this.state.registrationForm
        };
        const updatedFormElement = {
            ...updatedRegistrationForm[inputIdentifier]
        };
        updatedFormElement.value = event.target.value;
        updatedFormElement.valid = this.checkValidity(updatedFormElement.value, updatedFormElement.validation);
        updatedFormElement.touched = true;
        updatedRegistrationForm[inputIdentifier] = updatedFormElement;

        let formIsValid = true;
        for (let inputIdentifier in updatedRegistrationForm) {
            formIsValid = updatedRegistrationForm[inputIdentifier].valid && formIsValid;
        }
        this.setState({registrationForm: updatedRegistrationForm, formIsValid: formIsValid});
    };

    render(){

        const formElementsArray = [];
        for (let key in this.state.registrationForm) {
            formElementsArray.push({
                id: key,
                config: this.state.registrationForm[key]
            });
        }

        return (
            <div className={classes.Form}>

                <h3 className={classes.Heading}>{this.state.title}</h3>
                <form onSubmit={this.props.onsubmit}>

                    {formElementsArray.map(formElement => (
                        <Input
                            key={formElement.id}
                            elementType={formElement.config.elementType}
                            elementConfig={formElement.config.elementConfig}
                            value={formElement.config.value}
                            invalid={!formElement.config.valid}
                            shouldValidate={formElement.config.validation}
                            touched={formElement.config.touched}
                            changed={(event) => this.inputChangedHandler(event, formElement.id)} />
                    ))}
                    <button
                        disabled={!this.state.formIsValid}
                        className={classes.Button}>

                        Send</button>

                </form>
            </div>
        );

    }

};

export default Form;