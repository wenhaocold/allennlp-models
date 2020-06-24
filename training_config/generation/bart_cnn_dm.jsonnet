local model_name = "facebook/bart-large";

{
    "train_data_path": "",
    "validation_data_path": "",
    "dataset_reader": {
        "type": "cnn_dm",
        "source_tokenizer": {
            "type": "pretrained_transformer",
            "model_name": model_name
        },
        "source_token_indexers": {
            "tokens": {
                "type": "pretrained_transformer",
                "model_name": model_name,
                "namespace": "tokens"
            }
        },
        "source_max_tokens": 1022,
        "target_max_tokens": 54
    },
    "model": {
        "type": "bart",
        "model_name": model_name
    },
    "data_loader": {
        "batch_size": 4,
        "shuffle": true
    },
    "trainer": {
        "num_epochs": 3,
        "optimizer": {
            "type": "huggingface_adamw",
            "lr": 3e-5,
            "betas": [0.9, 0.999],
            "eps": 1e-8,
            "correct_bias": true
        },
        "learning_rate_scheduler": {
            "type": "polynomial_decay",
            "total_steps": 215334
        },
        "tensorboard_writer": {
            "summary_interval": 4,
            "should_log_learning_rate": true
        },
        "grad_norm": 1.0,
        "cuda_device": 0
    }
}
