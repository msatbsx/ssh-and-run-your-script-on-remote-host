 # ssh and run your script(command) on remote host.
 (e.g. git pull & yarn build, replace green-blue using mv)
 - Great to start more sophisticated use cases, fork and enjoy.
 - The most simplistic approach. No code. **Known and safe container image**. 

## Inputs (Options)

- **host** - Required, hostname or IP address of the server.

- **command** - Required, (script) Multiline shell script to be run on remote host.

- **key** - Required, that contains a private key authentication.

- **port** - Host ssh port number. **Default:** `22`

- **user** - Username for ssh authentication. **Default:** (ubuntu)

- **args** - SSH parameters.

## Outputs

### `time`

The time the job was done. Or demo how to add more stuff ;) 

## Example usage
- script may have many lines, (careful with indentation, it is YAML)

```yml
name: simple deployer
on: 
  push:
    branches:
      - main
jobs:
  remote_command_job:
    runs-on: ubuntu-latest
    name: SSH Remote command
    steps:
      - name: SSH Deployer
        uses: msatbsx/ssh-and-run-your-script-on-remote-host@v0.1.1 # replace with current tag, avoid using main or latest
        id: runner # important, used below in steps.runner... 
        with:
          host: ${{ secrets.HOST }}
          user: michal
          key: ${{ secrets.KEY }}
          command: |
            ls -lFa
      - name: Get the outputs
        run: echo "The time was ${{ steps.runner.outputs.time }}"
```

## Contribution
- PR's are welcomed.